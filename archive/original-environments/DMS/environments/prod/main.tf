locals {
  source_endpoints = {
    bolton = {
      endpoint_id   = var.source_endpoint_id
      engine_name   = var.source_engine_name
      username      = var.source_username != null ? var.source_username : (var.secrets_manager_secret_name != null ? lookup(local.dms_secrets, "username", null) : null)
      password      = var.source_password != null ? var.source_password : (var.secrets_manager_secret_name != null ? lookup(local.dms_secrets, "password", null) : null)
      server_name   = var.source_server_name
      port          = var.source_port
      database_name = var.source_database_name
      tags          = var.tags
    }
  }

  target_endpoints = {
    bolton = {
      endpoint_id   = var.target_endpoint_id
      bucket_name   = var.target_bucket_name
      iam_role_name = var.target_iam_role_name
      tags          = var.tags
    }
  }
}

data "aws_secretsmanager_secret_version" "dms_prod" {
  count     = var.secrets_manager_secret_name != null ? 1 : 0
  secret_id = var.secrets_manager_secret_name
  # optional: set `version_id` or `version_stage` if needed
}

locals {
  dms_secrets = var.secrets_manager_secret_name != null && length(trimspace(data.aws_secretsmanager_secret_version.dms_prod[0].secret_string)) > 0 ? jsondecode(data.aws_secretsmanager_secret_version.dms_prod[0].secret_string) : {}
}

module "endpoints" {
  source = "../../modules/dms_endpoints"

  source_endpoints = local.source_endpoints
  target_endpoints = local.target_endpoints

  secrets_manager_secret_name = var.secrets_manager_secret_name
  tags = var.tags
}

module "replication_instance" {
  source = "../../modules/dms_replication_instance"

  replication_instance_id    = var.replication_instance_id
  replication_instance_class = var.replication_instance_class
  allocated_storage          = var.allocated_storage
  engine_version             = var.engine_version

  tags = var.tags
}

locals {
  replication_tasks = {
    (var.replication_task_id) = {
      replication_instance_arn = module.replication_instance.replication_instance_arn
      source_endpoint_arn      = module.endpoints.source_endpoint_arn
      target_endpoint_arn      = module.endpoints.target_endpoint_arn
      table_mappings           = file("${path.module}/table-mappings.json")
      migration_type           = var.migration_type
      cdc_start_time           = var.cdc_start_time
      start_replication_task   = false
      tags                     = var.tags
    }
  }
}

module "replication_task" {
  source = "../../modules/dms_replication_task"

  replication_tasks = local.replication_tasks

  tags = var.tags
}
