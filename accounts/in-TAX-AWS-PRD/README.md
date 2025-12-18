**in-TAX-AWS-PRD README**

- **Purpose:** Contains environment-specific Terraform configurations for production services in the in-TAX-AWS-PRD account.

- **Services:** Airflow, Athena, Datasync, DMS, EMR, RDS, Redshift.

- **Recent changes:**
  - Datasync: `Datasync_location` and `Datasync_tasks` modules moved into `prod/` and parameterized for offline testing.
  - EMR: capacity variables converted to numeric types (see `prod/variables.tf` and `prod/terraform.tfvars`).
  - Tag handling: MWAA module set to ignore `tags_all` to avoid provider-applied tag churn.
  - Secrets: Secrets Manager `data` blocks were temporarily commented for offline `plan` runs; restore real secret names before `apply`.

- **Quick commands (per-service directory):**
# in-TAX-AWS-PRD — Production environment

Purpose: environment-specific Terraform roots for the in-TAX-AWS-PRD AWS account.

Services included:
- Airflow
- Athena
- Datasync
- DMS
- EMR
- RDS
- Redshift

Per-service README files are provided under each service folder. Each service `prod` root follows the same pattern:

Quick commands (run inside the service `prod` folder):

```powershell
terraform init
terraform validate
terraform plan -var-file=terraform.tfvars
```

Notes:
- Secrets Manager lookups may be optional in some roots to allow offline planning. Restore real secret names before `apply`.
- For shared modules, prefer a top-level `modules/` or `accounts/modules/` location and update module `source` paths.
- Use a shared `.terraform.lock.hcl` policy to keep provider versions consistent across environments.

If you want me to create or update any per-service README content, tell me which services to prioritize.
