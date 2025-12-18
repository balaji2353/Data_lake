RDS Prod Secrets

This folder creates or imports the RDS production secret used by Terraform.

Default secret name: `rds/prod/credentials`

Expected secret JSON shape:
{
  "username": "<master username>",
  "password": "<master password>"
}

Usage:
- Provide `rds_secret_string` as a sensitive variable to upload the secret value on `terraform apply`.
- Ensure the executing IAM principal has `secretsmanager:CreateSecret` and `secretsmanager:PutSecretValue` permissions.

Safety:
- The secret resource uses `lifecycle.prevent_destroy = true` to prevent accidental deletion.
- You can supply an optional `kms_key_id` to use a customer-managed KMS key.
