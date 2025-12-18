RDS Prod Secrets

Secret name: configurable via the Terraform variable `secrets_manager_secret_name` (default: `rds/prod/credentials`)

Expected secret string (JSON):
{
  "username": "<master username>",
  "password": "<master password>"
}

Notes:
- Terraform reads `username` and `password` from AWS Secrets Manager using `data.aws_secretsmanager_secret_version`.
- You can override by setting the `master_username` and `master_password` variables directly (not recommended for prod).
- Ensure the executing IAM principal has `secretsmanager:GetSecretValue` permission for the secret.
