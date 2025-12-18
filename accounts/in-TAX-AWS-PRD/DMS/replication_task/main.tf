locals {
  replication_tasks = {
    (var.replication_task_id) = {
      replication_instance_arn = var.replication_instance_arn
      source_endpoint_arn      = var.source_endpoint_arn
      target_endpoint_arn      = var.target_endpoint_arn
      table_mappings           = file(var.table_mappings_path)
      migration_type           = var.migration_type
      cdc_start_time           = var.cdc_start_time
      start_replication_task   = false
      tags                     = var.tags
    }
  }
}

module "replication_task" {
  source = "../modules/dms_replication_task"

  replication_tasks = local.replication_tasks
  tags = var.tags
}
