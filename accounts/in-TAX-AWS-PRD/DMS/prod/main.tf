locals {
  source_endpoints = length(var.source_endpoints) == 1 ? var.source_endpoints : {
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
  }

  target_endpoints = length(var.target_endpoints) == 1 ? var.target_endpoints : {
    (var.target_endpoint_id) = {
      endpoint_id   = var.target_endpoint_id
      bucket_name   = var.target_bucket_name
      iam_role_name = var.target_iam_role_name
      tags          = var.tags
    }
  }
}

module "endpoints" {
  source = "c:/terraform/accounts/in-TAX-AWS-PRD/DMS/modules/dms_endpoints"

  source_endpoints = local.source_endpoints
  target_endpoints = local.target_endpoints

  secrets_manager_secret_name = var.secrets_manager_secret_name
  tags = var.tags
}

data "terraform_remote_state" "replication" {
  backend = "local"
  config = {
    path = "../replication_instance/replication_instance.tfstate"
  }
}

locals {
  replication_instance_arn = try(data.terraform_remote_state.replication.outputs.replication_instance_arn, "")
}

locals {
  replication_tasks = {
    (var.replication_task_id) = {
      replication_instance_arn = local.replication_instance_arn
      source_endpoint_arn      = lookup(module.endpoints.source_endpoint_arn, element(keys(local.source_endpoints), 0), null)
      target_endpoint_arn      = lookup(module.endpoints.target_endpoint_arn, element(keys(local.target_endpoints), 0), null)
      table_mappings           = file("${path.module}/table-mappings.json")
      migration_type           = var.migration_type
      cdc_start_time           = var.cdc_start_time
      start_replication_task   = false
      tags                     = var.tags
    }
  }
}

module "replication_task" {
  source = "c:/terraform/accounts/in-TAX-AWS-PRD/DMS/modules/dms_replication_task"

  replication_tasks = local.replication_tasks

  tags = var.tags
}
