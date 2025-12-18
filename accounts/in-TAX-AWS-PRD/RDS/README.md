RDS (in-TAX-AWS-PRD)

This folder contains Terraform for RDS instances (Aurora/RDS) and related networking in production.

Structure
- `prod/` — production root with DB resources and subnet groups

Key variables (see `prod/variables.tf`)
- `db_identifier` (string)
- `engine` (string): e.g. `postgres`, `mysql`, `sqlserver`
- `instance_class` (string)
- `username` / `password` — prefer Secrets Manager instead of committing

Example `prod/terraform.tfvars`
```hcl
db_identifier = "in-tax-main"
engine        = "postgres"
instance_class = "db.t3.medium"
allocated_storage = 100
tags = { Environment = "prod" }
```

Secrets
- Use Secrets Manager to store DB credentials and reference via `secrets_manager_secret_name` variable.

Quick commands
```powershell
terraform init
terraform validate
terraform plan -var-file=terraform.tfvars
```
