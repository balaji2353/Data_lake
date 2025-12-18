Secrets helper

This folder provides a minimal Terraform root to create or update a Secrets Manager secret used by DMS endpoints.

Usage:

1. Edit `terraform.tfvars` or pass `-var 'secret_string=...` containing a JSON string with keys: `username`, `password`, `engine` (or `engine_name`), and `database`.
2. Run `terraform init -reconfigure -backend-config=...` and `terraform apply`.

Be careful: secrets are sensitive. Prefer passing the secret via environment or CI secrets rather than committing it.
Creates an AWS Secrets Manager secret for DMS credentials.

Expected secret JSON shape (when read by modules):
{
  "username": "db_user",
  "password": "p@ssw0rd"
}

Notes:
- This module creates a secret and an initial secret version. You can supply `username`/`password` via `-var` when running `terraform apply` or update the secret later using the AWS Console, AWS CLI, or Terraform `aws_secretsmanager_secret_version`.
- By default `prevent_destroy = true` to avoid accidental deletion; set to `false` only with caution.

Example apply to create a secret with values (local run):

```powershell
terraform -chdir="C:\terraform\DMS\environments\prod\secrets" init -backend=false
terraform -chdir="C:\terraform\DMS\environments\prod\secrets" plan -var "username=svc_user" -var "password=ChangeMe!" -out secret.plan
terraform -chdir="C:\terraform\DMS\environments\prod\secrets" apply secret.plan
```

To update the secret later with Terraform, change values and run `terraform apply` again, or use the AWS CLI to put a new secret value:

```powershell
aws secretsmanager put-secret-value --secret-id dms/prod/credentials --secret-string '{"username":"svc_user","password":"NewP@ss"}'
```
