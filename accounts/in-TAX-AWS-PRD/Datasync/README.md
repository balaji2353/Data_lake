Datasync (in-TAX-AWS-PRD)

This folder contains Terraform for AWS DataSync (locations, tasks) in production.

Structure
- `modules/` — reusable DataSync location/task modules
- `prod/` — production root wiring locations and tasks

Key modules
- `datasync_location` — creates DataSync locations (S3, EFS, NFS)
- `datasync_task` — creates tasks to transfer data between locations

Important variables (see `prod/variables.tf`)
- `source_location` / `destination_location` (maps)
- `task_options` (map): options such as `preserve_metadata`, `verify_mode`

Example `prod/terraform.tfvars`
```hcl
source_location = {
	type = "s3"
	bucket = "taxdata-source"
}
destination_location = {
	type = "s3"
	bucket = "taxdata-destination"
}
task_options = { verify_mode = "POINT_IN_TIME_CONSISTENT" }
```

Quick commands
```powershell
terraform init
terraform validate
terraform plan -var-file=terraform.tfvars
```

Notes
- DataSync tasks can incur charges — review transfer settings and schedules before `apply`.
# Datasync Terraform (in-TAX-AWS-PRD)

This folder contains Terraform configuration for the DataSync deployment in the in-TAX-AWS-PRD account.

Structure
- `prod/` — environment root for production. Contains environment-specific inputs, backend/provider config, and module calls. Run `terraform init/plan/apply` from this folder.
- `modules/datasync/` — shared reusable module implementing DataSync resources used by the `prod` root.

Recent changes
- `Datasync_location` and `Datasync_tasks` were moved into `prod/` to keep environment-specific implementations local (Option A).
- `Datasync_tasks` was parameterized to accept `ip_address`, `name`, and `security_group_arns` so it can validate without referencing root resources.
- Secrets Manager `data` reads were temporarily commented out in `prod/main.tf` to allow offline/local validation. See "Offline testing" below.

Offline testing
- The `prod/main.tf` currently has Secrets Manager `data` blocks and dependent `locals` commented out for offline testing. To test offline:

```powershell
cd C:\terraform\accounts\in-TAX-AWS-PRD\Datasync\prod
terraform init
terraform validate
terraform plan
```

Restoring live behavior
- To run against real AWS secrets restore (uncomment) the two `data "aws_secretsmanager_secret_version"` blocks and the `locals` block in `prod/main.tf` and provide real values for:

```hcl
rds_secret_name = "<secret-id-or-arn>"
dms_secret_name = "<secret-id-or-arn>"
```

Tags
- Provider `default_tags` are applied at the provider level; modules accept `tags` as input. If you want `tags` and `tags_all` to match, ensure module `tags` include the provider defaults.

Next steps (suggested)
- Final cleanup: remove leftover `.terraform` directories in module folders and commit a locked `.terraform.lock.hcl` from the target environment.
- If you need modules reusable across environments, move `Datasync_location` and `Datasync_tasks` back to `modules/` and update `prod/main.tf` sources accordingly.

If you want, I can: revert the temporary comments and add a local-only `.tfvars` with placeholder secret names for testing, remove `.terraform` artifacts, or move modules back to `modules/` for reuse.
