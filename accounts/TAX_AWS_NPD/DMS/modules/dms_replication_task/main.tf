locals {
  replication_tasks_coalesced = length(var.replication_tasks) > 0 ? var.replication_tasks : (
    var.replication_task_id != "" ? {
      (var.replication_task_id) = {
        replication_instance_arn = var.replication_instance_arn
        source_endpoint_arn      = var.source_endpoint_arn
        target_endpoint_arn      = var.target_endpoint_arn
        table_mappings           = var.table_mappings
        migration_type           = var.migration_type
        cdc_start_time           = var.cdc_start_time
        start_replication_task   = var.start_replication_task
        tags                     = var.tags
      }
    } : {}
  )
}

resource "aws_dms_replication_task" "this" {
  for_each = local.replication_tasks_coalesced

  replication_task_id      = each.key
  replication_instance_arn = each.value.replication_instance_arn
  source_endpoint_arn      = each.value.source_endpoint_arn
  target_endpoint_arn      = each.value.target_endpoint_arn
  migration_type           = lookup(each.value, "migration_type", "full-load-and-cdc")
  table_mappings           = each.value.table_mappings
  cdc_start_time           = lookup(each.value, "cdc_start_time", null)
  start_replication_task   = lookup(each.value, "start_replication_task", false)

  tags = lookup(each.value, "tags", {})
}
