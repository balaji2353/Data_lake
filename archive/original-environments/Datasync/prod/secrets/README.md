Purpose

This folder contains Terraform to create AWS Secrets Manager secrets for prod services (RDS and DMS) for the Datasync project.

Usage

- Do NOT hardcode credentials in repo. Provide the secret JSON via a sensitive variable when applying with Terraform.

Example secret JSON shape (RDS and DMS):
{
  "username": "<user>",
  "password": "<password>"
}

Default secret name created by this module:
- DMS: `datasync/prod/dms_credentials`

You can override via the Terraform variable `dms_secret_name`.

To create the secrets (safest: provide secret strings via environment variables or secure CI variables):

PowerShell example (escape JSON):

```powershell
$secretJson = '{"username":"postgres","password":"S3cureP@ssw0rd"}'
terraform apply -var "rds_secret_string=$secretJson" -var "dms_secret_string=$secretJson"
```

Or using `terraform.tfvars` (not recommended for prod):

```hcl
rds_secret_string = "{\"username\":\"postgres\",\"password\":\"...\"}"
```

Notes

- If you leave `*_secret_string` as null, Terraform will create the secret record but will not create a secret version (no secret value will be uploaded).
- Ensure the executing IAM principal has `secretsmanager:CreateSecret` and `secretsmanager:PutSecretValue` (for versions) permissions.
- You can also import an existing secret and skip creating a version via `terraform import`.
 - You can supply an optional KMS key via the `kms_key_id` variable to encrypt the secret. If omitted, the Secrets Manager default KMS key is used.
 - For safety, the created secrets include `lifecycle { prevent_destroy = true }`. To remove a secret you must first update the resource lifecycle or import and delete it manually.
