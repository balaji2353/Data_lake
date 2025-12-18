DMS (in-TAX-AWS-PRD)

This folder contains Terraform for AWS DMS (endpoints, replication instance, replication tasks) in production.

Structure:
- `modules/` — reusable modules for endpoints, replication_instance, replication_task
- `replication_instance/` — separate root for the shared replication instance (single-create)
- `source_endpoint/`, `target_endpoint/` — separate roots to create single endpoints
- `replication_task/` — root that consumes remote state from the other roots
- `prod/` — legacy/coalesced root (keeps single-endpoint compatibility)

Quick commands (example):

```powershell
terraform -chdir=replication_instance init -reconfigure -backend-config="bucket=your-bucket" -backend-config="key=accounts/in-TAX-AWS-PRD/DMS/replication_instance/replication_instance.tfstate" -backend-config="region=us-east-1"
terraform -chdir=replication_instance plan -var-file=terraform.tfvars
```

Secrets:
- Endpoints can read credentials from Secrets Manager; provide `secrets_manager_secret_name` in the endpoint `terraform.tfvars`.
- A helper root is available at `prod/secrets` to create/update the Secrets Manager secret.

Notes:
- Use the replication_instance root as the first deployment (it provides the ARN read by tasks).
- Replace placeholder S3 backend values with real bucket/key when enabling remote state.
DMS workspace — quick reference

Overview
- DMS resources are split into:
	- `replication_instance/` — separate root and state for the DMS replication instance (create once)
	- `modules/` — reusable modules: `dms_endpoints`, `dms_replication_instance`, `dms_replication_task`
	- `prod/` — root that creates endpoints and replication tasks and reads the replication instance ARN from the replication root state

Repository layout

- `accounts/in-TAX-AWS-PRD/DMS/replication_instance/` — standalone root that manages the replication instance and writes `replication_instance.tfstate` (local by default)
- `accounts/in-TAX-AWS-PRD/DMS/modules/` — modules used by the roots
- `accounts/in-TAX-AWS-PRD/DMS/prod/` — main root that provisions endpoints & tasks and reads the replication instance ARN via `terraform_remote_state`

Create the replication instance (one-time)

PowerShell:
```
$Env:TF_VAR_replication_instance_id = "bolton-rep-instance"
terraform -chdir=accounts/in-TAX-AWS-PRD/DMS/replication_instance init
terraform -chdir=accounts/in-TAX-AWS-PRD/DMS/replication_instance apply -auto-approve
```

Notes: the replication root now uses an S3 backend (replace the placeholder values in `replication_instance/backend.tf` or supply them at init).

Example (init with backend-config):
```
terraform -chdir=accounts/in-TAX-AWS-PRD/DMS/replication_instance init \
	-backend-config="bucket=your-terraform-state-bucket" \
	-backend-config="key=accounts/in-TAX-AWS-PRD/DMS/replication_instance/replication_instance.tfstate" \
	-backend-config="region=us-east-1"
```

For CI/team usage, create a dedicated S3 bucket with encryption and proper IAM policies, then run the init above or set the values in `replication_instance/backend.tf`.

Separate roots and state files
- `replication_instance/` — owns the replication instance state (S3 backend placeholder).
- `source_endpoint/` — owns the source endpoint state; outputs `endpoint_arn` and `endpoint_id`.
- `target_endpoint/` — owns the target endpoint state; outputs `endpoint_arn` and `endpoint_id`.
- `replication_task/` — owns replication tasks and reads the replication instance and endpoints via `terraform_remote_state`.

Quick workflow
1. Create the S3 bucket and IAM policy (see below), or choose an existing bucket.
2. Initialize & apply `replication_instance`:
```
terraform -chdir=accounts/in-TAX-AWS-PRD/DMS/replication_instance init -backend-config="bucket=your-bucket" -backend-config="region=us-east-1"
terraform -chdir=accounts/in-TAX-AWS-PRD/DMS/replication_instance apply -var-file=terraform.tfvars -auto-approve
```
3. Initialize & apply `source_endpoint` and `target_endpoint` (supply credentials via tfvars or Secrets Manager):
```
terraform -chdir=accounts/in-TAX-AWS-PRD/DMS/source_endpoint init -backend-config="bucket=your-bucket" -backend-config="region=us-east-1"
terraform -chdir=accounts/in-TAX-AWS-PRD/DMS/source_endpoint apply -var-file=terraform.tfvars -auto-approve

terraform -chdir=accounts/in-TAX-AWS-PRD/DMS/target_endpoint init -backend-config="bucket=your-bucket" -backend-config="region=us-east-1"
terraform -chdir=accounts/in-TAX-AWS-PRD/DMS/target_endpoint apply -var-file=terraform.tfvars -auto-approve
```
4. Initialize & plan/apply `replication_task` (reads outputs from prior roots):
```
terraform -chdir=accounts/in-TAX-AWS-PRD/DMS/replication_task init -backend-config="bucket=your-bucket" -backend-config="region=us-east-1"
terraform -chdir=accounts/in-TAX-AWS-PRD/DMS/replication_task plan -var-file=terraform.tfvars
terraform -chdir=accounts/in-TAX-AWS-PRD/DMS/replication_task apply -var-file=terraform.tfvars -auto-approve
```

IAM & bucket notes
- Create an S3 bucket for Terraform state with server-side encryption and versioning enabled.
- Create an IAM user/role with permissions to read/write the bucket and optionally lock DynamoDB if you add state locking.


Use the instance from `prod` (after the replication root exists)

PowerShell:
```
terraform -chdir=accounts/in-TAX-AWS-PRD/DMS/prod init
terraform -chdir=accounts/in-TAX-AWS-PRD/DMS/prod plan -var-file="../modules/terraform.tfvars" -input=false
terraform -chdir=accounts/in-TAX-AWS-PRD/DMS/prod apply -var-file="../modules/terraform.tfvars" -auto-approve
```

Secrets
- Supply `secrets_manager_secret_name` at runtime via an env var to avoid committing secrets:
```
$env:TF_VAR_secrets_manager_secret_name = "arn:aws:secretsmanager:..."
terraform -chdir=accounts/in-TAX-AWS-PRD/DMS/prod plan -var-file="../modules/terraform.tfvars"
Remove-Item Env:\TF_VAR_secrets_manager_secret_name
```

Workspace cleanup (safe)
- Remove local Terraform caches and lock files if you run into module-install or path issues:
```
Get-ChildItem -Recurse -Directory -Filter '.terraform' | ForEach-Object { Remove-Item -LiteralPath $_.FullName -Recurse -Force }
Get-ChildItem -Recurse -File -Include '.terraform.lock.hcl' | ForEach-Object { Remove-Item -LiteralPath $_.FullName -Force }
```

Validation commands (quick checks)
- Validate modules root:
```
terraform -chdir=accounts/in-TAX-AWS-PRD/DMS/modules init -backend=false
terraform -chdir=accounts/in-TAX-AWS-PRD/DMS/modules validate
```
- Validate prod root:
```
terraform -chdir=accounts/in-TAX-AWS-PRD/DMS/prod init -backend=false
terraform -chdir=accounts/in-TAX-AWS-PRD/DMS/prod validate
```

When to change this layout
- If you prefer a single state, you can import the replication instance into the prod root; otherwise keep the separate root for clear ownership and easier lifecycle management.

Support
- I can convert the replication root to use an S3 backend and add CI snippets for injecting the Secrets Manager ARN. Just tell me which option you prefer.
 -Support
-- I can convert the replication root to use an S3 backend and add CI snippets for injecting the Secrets Manager ARN. Just tell me which option you prefer.

Detailed module list

Modules under `modules/`:
- `dms_endpoints`
	- `dms_source_endpoint` — creates a source endpoint (parameters: `endpoint_id`, `engine_name`, `username`, `password`, `server_name`, `port`, `database_name`, `secrets_manager_secret_name`, `tags`)
	- `dms_target_endpoint` — creates a target endpoint (parameters: `endpoint_id`, `bucket_name`, `iam_role_name`, `existing_role_arn`, `tags`)
- `dms_replication_instance` — manages the replication instance (parameters: `replication_instance_id`, `instance_class`, `allocated_storage`, `tags`)
- `dms_replication_task` — creates replication tasks (parameters: `replication_tasks` map, `table_mappings`, `migration_type`, `cdc_start_time`, `tags`)

Recommended variables and tfvars examples

1) Replication instance (`replication_instance/terraform.tfvars`)

```hcl
replication_instance_id = "bolton-rep-instance"
instance_class          = "dms.t3.medium"
allocated_storage       = 50
tags = { Environment = "prod" }
```

2) Source endpoint (`source_endpoint/terraform.tfvars`) — using Secrets Manager (preferred)

```hcl
endpoint_id                  = "bolton-gst-analytics"
secrets_manager_secret_name  = "arn:aws:secretsmanager:ap-south-1:123456789012:secret:dms/prod/credentials"
server_name                  = "in-bolton-uat-db.cqd9d5qa5zwv.ap-south-1.rds.amazonaws.com"
port                         = 1433
tags = { Environment = "prod" }
```

Or explicit credentials (not recommended to commit):

```hcl
username      = "DMSForITP"
password      = "super-secret"
engine_name   = "sqlserver"
database_name = "GSTPlusAnalytics"
```

3) Target endpoint (`target_endpoint/terraform.tfvars`)

```hcl
endpoint_id     = "bolton-target-gstin"
bucket_name     = "taxdata-lake-bronze-prod"
iam_role_name   = "dms-s3-target-role"
tags = { Environment = "prod" }
```

4) Replication task (`replication_task/terraform.tfvars`)

```hcl
replication_task_id = "bolton-gstplus"
migration_type      = "full-load-and-cdc"
cdc_start_time      = null
table_mappings_path = "../prod/table-mappings.json"
tags = { Environment = "prod" }
```

Secrets helper (`prod/secrets/terraform.tfvars`):

```hcl
aws_region    = "ap-south-1"
secret_name   = "dms/prod/credentials"
secret_string = jsonencode({
	username = "DMSForITP",
	password = "REPLACE_ME",
	engine   = "sqlserver",
	database = "GSTPlusAnalytics"
})
```

Notes on Secrets Manager
- The endpoint modules will accept either explicit username/password or `secrets_manager_secret_name` that points to a JSON secret string with keys `username`, `password`, `engine` (or `engine_name`), and `database`.
- For CI, set `DMS_SECRETS_MANAGER_ARN` as a repo secret and inject it into workflows as `TF_VAR_secrets_manager_secret_name`.

Further help
- If you want full examples for a specific service flow (create replication instance → source → target → task), tell me which environment (dev/prod) and I will add a step-by-step runbook.

CI (GitHub Actions)
- **Workflow file**: `.github/workflows/dms-ci.yml` — runs `terraform init` and `terraform plan` for the DMS `prod` root and can optionally run `apply` (trigger via `workflow_dispatch`).
- **Required repo secrets**: set these in your repository settings -> Secrets:
	- **DMS_SECRETS_MANAGER_ARN**: the Secrets Manager secret ARN to inject as `TF_VAR_secrets_manager_secret_name`.
	- **AWS_ACCESS_KEY_ID**, **AWS_SECRET_ACCESS_KEY**, **AWS_REGION** (or configure role-based access in the workflow).
- **Usage**: trigger the workflow manually (Actions → DMS Prod Plan) or push to your branch if you add more triggers. The workflow sets `TF_VAR_secrets_manager_secret_name` from `DMS_SECRETS_MANAGER_ARN`, so Terraform receives it without committing any secret in the repo.

If you want, I can also add a second workflow that runs in CI to create the replication instance root or convert the replication root to an S3 backend for shared state — tell me which you'd prefer.
