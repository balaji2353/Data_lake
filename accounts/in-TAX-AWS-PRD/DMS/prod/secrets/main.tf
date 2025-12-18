resource "aws_secretsmanager_secret" "dms_secret" {
  name = var.secret_name
}

resource "aws_secretsmanager_secret_version" "dms_secret_version" {
  secret_id     = aws_secretsmanager_secret.dms_secret.id
  secret_string = var.secret_string != null ? var.secret_string : jsonencode({
    username = "REPLACE_ME",
    password = "REPLACE_ME",
    engine   = "REPLACE_ME",
    database = "REPLACE_ME"
  })
}
resource "aws_secretsmanager_secret" "this" {
  name = var.secret_name

  kms_key_id = var.kms_key_id

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    ManagedBy   = "Terraform"
    Environment = "prod"
  }
}

resource "aws_secretsmanager_secret_version" "this" {
  secret_id = aws_secretsmanager_secret.this.id

  secret_string = jsonencode({
    username = var.username != null ? var.username : "",
    password = var.password != null ? var.password : ""
  })
}
