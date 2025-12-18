Airflow (in-TAX-AWS-PRD)

This folder contains Terraform for MWAA (Managed Workflows for Apache Airflow) in the in-TAX-AWS-PRD account.

Structure
- `modules/` — reusable components (environment config, networking, MWAA module)
- `prod/` — production root that wires modules together

Key modules
- `mwaa` (in `modules/`): creates the MWAA environment, environment policies, and IAM roles.

Important variables (see `prod/variables.tf`)
- `environment_name` (string): MWAA environment name
- `vpc_id` / `subnet_ids` (string / list): networking
- `airflow_version` (string): MWAA version
- `tags` (map): resource tags

Example `prod/terraform.tfvars`
```hcl
environment_name = "in-tax-mwaa-prod"
airflow_version  = "2.4.3"
vpc_id           = "vpc-0123456789abcdef0"
subnet_ids       = ["subnet-aaa","subnet-bbb"]
tags = { Environment = "prod" }
```

Quick commands (inside `prod`)
```powershell
terraform init
terraform validate
terraform plan -var-file=terraform.tfvars
```

Notes
- Keep sensitive values (e.g., S3 bucket ARNs or service role ARNs) out of source; pass via `terraform.tfvars` or environment variables.
- Use a remote backend (S3 + DynamoDB lock) for team workflows.
