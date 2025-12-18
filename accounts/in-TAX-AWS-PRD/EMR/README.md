EMR (in-TAX-AWS-PRD)

This folder contains Terraform for EMR clusters and related resources (EMR Serverless / EMR clusters) in production.

Structure
- `prod/` — production root
- `modules/` — reusable components (cluster config, autoscaling)

Key variables (see `prod/variables.tf`)
- `cluster_name` (string)
- `instance_type` (string)
- `master_count` / `core_count` (numbers)
- `bootstrap_actions` (list)

Example `prod/terraform.tfvars`
```hcl
cluster_name = "tax-emr-prod"
instance_type = "m5.xlarge"
master_count  = 1
core_count    = 2
tags = { Environment = "prod" }
```

Quick commands
```powershell
terraform init
terraform validate
terraform plan -var-file=terraform.tfvars
```

Notes
- Ensure EMR instance profiles and service roles exist or are created by the module.
