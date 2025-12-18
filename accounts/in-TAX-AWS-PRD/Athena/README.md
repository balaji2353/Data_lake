Athena (in-TAX-AWS-PRD)

This folder contains Terraform for AWS Athena (workgroups, named queries, glue catalog integration) in production.

Structure
- `prod/` — production root

Key components
- AWS Glue Data Catalog configuration
- Athena workgroup(s) and optional named queries

Important variables (see `prod/variables.tf`)
- `workgroup_name` (string)
- `result_configuration` (map): S3 bucket and encryption for query results
- `glue_database` / `glue_tables` (strings/lists)

Example `prod/terraform.tfvars`
```hcl
workgroup_name = "tax-analytics-prod"
result_configuration = {
	bucket = "taxdata-query-results-prod"
	encryption_option = "SSE-S3"
}
glue_database = "taxdata"
```

Quick commands
```powershell
terraform init
terraform validate
terraform plan -var-file=terraform.tfvars
```

Notes
- Ensure the S3 bucket for `result_configuration` exists and has proper IAM policies for Athena.
