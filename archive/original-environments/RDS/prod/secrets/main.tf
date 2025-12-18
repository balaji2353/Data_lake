resource "aws_secretsmanager_secret" "rds_prod" {
  name        = var.rds_secret_name
  description = "RDS production credentials"
  tags        = var.tags
  kms_key_id  = var.kms_key_id

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_secretsmanager_secret_version" "rds_prod_version" {
  count         = var.rds_secret_string != null ? 1 : 0
  secret_id     = aws_secretsmanager_secret.rds_prod.id
  secret_string = var.rds_secret_string
}
