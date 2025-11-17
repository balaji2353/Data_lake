# AWS DMS (Database Migration Service)

This folder contains Terraform modules and environment configurations for AWS DMS.

Use the environment folders to manage resources:

- `environments/dev` — development
- `environments/prod` — production

Modules are under `modules/` (for example: `dms_endpoints`, `dms_replication_instance`, `dms_replication_task`).

Quick start (dev):

```powershell
Set-Location C:\terraform\DMS\environments\dev
terraform init
terraform plan
```

If you are migrating existing resources, review state migration steps (use `terraform state mv` to map old addresses to new module addresses) or re-import resources.

See the individual module folders under `modules/` and the `environments/*/variables.tf` files for inputs/outputs.

Examples: multi-endpoint and multi-task usage

Create multiple endpoints and tasks by passing maps to the modules. Example (environment `main.tf`):

```hcl
# define source and target endpoint maps (can come from vars or locals)
locals {
	source_endpoints = {
		src1 = {
			endpoint_id   = "bolton-src1"
			engine_name   = "sqlserver"
			username      = "DMSForITP"
			password      = var.source_password
			server_name   = "in-bolton-uat-db..."
			port          = 1433
			database_name = "GSTPlusAnalytics"
			tags          = { Environment = "dev" }
		}
	}

	target_endpoints = {
		t1 = {
			endpoint_id   = "bolton-target-gstin"
			bucket_name   = "taxdata-lake-bronze-uat"
			iam_role_name = "dms-s3-target-role"
		}
	}

	replication_tasks = {
		"bolton-gstplus" = {
			replication_instance_arn = module.replication_instance.replication_instance_arn
			source_endpoint_arn      = module.endpoints.source_endpoints["src1"].endpoint_arn
			target_endpoint_arn      = module.endpoints.target_endpoints["t1"].endpoint_arn
			table_mappings           = file("${path.module}/table-mappings.json")
			migration_type           = "full-load-and-cdc"
			cdc_start_time           = "2025-12-01T05:50:00Z"
		}
	}
}

module "endpoints" {
	source = "../../modules/dms_endpoints"
	source_endpoints = local.source_endpoints
	target_endpoints = local.target_endpoints
}

module "replication_task" {
	source = "../../modules/dms_replication_task"
	replication_tasks = local.replication_tasks
}
```

Notes:
- Modules remain backward-compatible with single-item usage. If you pass the original single variables, the modules will coalesce them into single-item maps automatically.
- When using multiple endpoints/tasks, module outputs return maps (for example `module.endpoints.source_endpoints` and `module.replication_task.replication_task_arns`).
