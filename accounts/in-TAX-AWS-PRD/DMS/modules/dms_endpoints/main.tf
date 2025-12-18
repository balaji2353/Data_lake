locals {
  dms_secrets = var.secrets_manager_secret_name != null && length(trimspace(data.aws_secretsmanager_secret_version.dms_prod[0].secret_string)) > 0 ? jsondecode(data.aws_secretsmanager_secret_version.dms_prod[0].secret_string) : {}

  source_endpoints_coalesced = length(var.source_endpoints) > 0 ? var.source_endpoints : {}

  target_endpoints_coalesced = length(var.target_endpoints) > 0 ? var.target_endpoints : {}
}

data "aws_secretsmanager_secret_version" "dms_prod" {
  count     = var.secrets_manager_secret_name != null ? 1 : 0
  secret_id = var.secrets_manager_secret_name
}

module "source_endpoint" {
  for_each = local.source_endpoints_coalesced
  source   = "./dms_source_endpoint"

  endpoint_id   = each.value.endpoint_id
  engine_name   = each.value.engine_name
  username      = lookup(each.value, "username", null)
  password      = lookup(each.value, "password", null)
  secrets_manager_secret_name = lookup(each.value, "secrets_manager_secret_name", var.secrets_manager_secret_name)
  server_name   = each.value.server_name
  port          = each.value.port
  database_name = each.value.database_name

  tags = merge(var.tags, lookup(each.value, "tags", {}))
}

module "target_endpoint" {
  for_each = local.target_endpoints_coalesced
  source   = "./dms_target_endpoint"

  endpoint_id   = each.value.endpoint_id
  bucket_name   = each.value.bucket_name
  iam_role_name = each.value.iam_role_name
  existing_role_arn = lookup(each.value, "existing_role_arn", null)

  tags = merge(var.tags, lookup(each.value, "tags", {}))
}

output "source_endpoint_arn" {
  value = { for k, m in module.source_endpoint : k => m.endpoint_arn }
}

# output "target_endpoint_arn" {
#   value = { for k, m in module.target_endpoint : k => m.endpoint_arn }
# }

output "target_endpoint_arn" {
  value = { for k, m in module.target_endpoint : k => m.endpoint_arn }
}
