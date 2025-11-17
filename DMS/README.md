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
