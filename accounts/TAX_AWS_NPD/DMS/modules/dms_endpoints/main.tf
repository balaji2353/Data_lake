locals {
  source_endpoints_coalesced = length(var.source_endpoints) > 0 ? var.source_endpoints : (
    var.source_endpoint_id != "" ? {
      (var.source_endpoint_id) = {
        endpoint_id   = var.source_endpoint_id
        engine_name   = var.source_engine_name
        username      = var.source_username
        password      = var.source_password
        server_name   = var.source_server_name
        port          = var.source_port
        database_name = var.source_database_name
        tags          = var.tags
      }
    } : {}
  )

  target_endpoints_coalesced = length(var.target_endpoints) > 0 ? var.target_endpoints : (
    var.target_endpoint_id != "" ? {
      (var.target_endpoint_id) = {
        endpoint_id   = var.target_endpoint_id
        bucket_name   = var.target_bucket_name
        iam_role_name = var.target_iam_role_name
        tags          = var.tags
      }
    } : {}
  )
}

module "source_endpoint" {
  for_each = local.source_endpoints_coalesced
  source   = "./dms_source_endpoint"

  endpoint_id   = each.value.endpoint_id
  engine_name   = each.value.engine_name
  username      = each.value.username
  password      = each.value.password
  secrets_manager_secret_name = lookup(each.value, "secrets_manager_secret_name", var.secrets_manager_secret_name)
  server_name   = each.value.server_name
  port          = each.value.port
  database_name = each.value.database_name

  tags = lookup(each.value, "tags", var.tags)
}

module "target_endpoint" {
  for_each = local.target_endpoints_coalesced
  source   = "./dms_target_endpoint"

  endpoint_id   = each.value.endpoint_id
  bucket_name   = each.value.bucket_name
  iam_role_name = each.value.iam_role_name

  tags = lookup(each.value, "tags", var.tags)
}
