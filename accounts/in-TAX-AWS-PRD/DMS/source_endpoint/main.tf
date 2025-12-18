data "aws_secretsmanager_secret" "sm" {
  count = var.secrets_manager_secret_name != null ? 1 : 0
  name  = var.secrets_manager_secret_name
}

data "aws_secretsmanager_secret_version" "smv" {
  count     = var.secrets_manager_secret_name != null ? 1 : 0
  secret_id = data.aws_secretsmanager_secret.sm[0].id
}

locals {
  secret_map = var.secrets_manager_secret_name != null ? try(jsondecode(data.aws_secretsmanager_secret_version.smv[0].secret_string), {}) : {}

  effective_engine_name = var.engine_name != null ? var.engine_name : lookup(local.secret_map, "engine_name", lookup(local.secret_map, "engine", null))
  effective_database_name = var.database_name != null ? var.database_name : lookup(local.secret_map, "database_name", lookup(local.secret_map, "database", null))
  effective_username = var.username != null ? var.username : lookup(local.secret_map, "username", null)
  effective_password = var.password != null ? var.password : lookup(local.secret_map, "password", null)
}

module "source_endpoint" {
  source = "../modules/dms_endpoints/dms_source_endpoint"

  endpoint_id                  = var.endpoint_id
  engine_name                  = local.effective_engine_name
  username                     = local.effective_username
  password                     = local.effective_password
  secrets_manager_secret_name  = var.secrets_manager_secret_name
  server_name                  = var.server_name
  port                         = var.port
  database_name                = local.effective_database_name

  tags = var.tags
}

output "endpoint_id" { value = module.source_endpoint.endpoint_id }
output "endpoint_arn" { value = module.source_endpoint.endpoint_arn }
