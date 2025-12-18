resource "aws_secretsmanager_secret" "dms_prod" {
  name        = var.dms_secret_name
  description = "DMS production credentials"
  tags        = var.tags
  kms_key_id  = var.kms_key_id

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_secretsmanager_secret_version" "dms_prod_version" {
  count         = var.dms_secret_string != null ? 1 : 0
  secret_id     = aws_secretsmanager_secret.dms_prod.id
  secret_string = var.dms_secret_string
}
