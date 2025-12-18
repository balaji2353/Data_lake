data "aws_secretsmanager_secret_version" "creds" {
  count     = var.secrets_manager_secret_name != null ? 1 : 0
  secret_id = var.secrets_manager_secret_name
}

locals {
  secret = var.secrets_manager_secret_name != null ? jsondecode(data.aws_secretsmanager_secret_version.creds[0].secret_string) : {}
}

resource "aws_dms_endpoint" "source" {
  endpoint_id   = var.endpoint_id
  endpoint_type = "source"
  engine_name   = var.engine_name
  username      = var.username != null ? var.username : (var.secrets_manager_secret_name != null ? lookup(local.secret, "username", null) : null)
  password      = var.password != null ? var.password : (var.secrets_manager_secret_name != null ? lookup(local.secret, "password", null) : null)
  server_name   = var.server_name
  port          = var.port
  database_name = var.database_name

  tags = var.tags
}
