Redshift (in-TAX-AWS-PRD)

This folder contains Terraform for Amazon Redshift clusters, parameter groups and related resources in production.

Structure
- `prod/` — production root

Key variables (see `prod/variables.tf`)
- `cluster_identifier` (string)
- `node_type` (string)
- `number_of_nodes` (number)
- `master_username` / `master_password` — prefer Secrets Manager

Example `prod/terraform.tfvars`
```hcl
cluster_identifier = "tax-redshift-prod"
node_type = "ra3.xlplus"
number_of_nodes = 2
tags = { Environment = "prod" }
```

Notes
- Redshift credentials should be stored in Secrets Manager, and network access controlled via security groups.
- Review snapshot and retention settings before applying to avoid unexpected backups or deletions.
