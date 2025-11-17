module "endpoints" {
  source = "../../modules/dms_endpoints"

  source_endpoint_id      = var.source_endpoint_id
  source_engine_name      = var.source_engine_name
  source_username         = var.source_username
  source_password         = var.source_password
  source_server_name      = var.source_server_name
  source_port             = var.source_port
  source_database_name    = var.source_database_name

  target_endpoint_id      = var.target_endpoint_id
  target_bucket_name      = var.target_bucket_name
  target_iam_role_name    = var.target_iam_role_name

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

module "replication_task" {
  source = "../../modules/dms_replication_task"

  replication_task_id      = var.replication_task_id
  replication_instance_arn = module.replication_instance.replication_instance_arn
  source_endpoint_arn      = module.endpoints.source_endpoint_arn
  target_endpoint_arn      = module.endpoints.target_endpoint_arn
  migration_type           = var.migration_type
  table_mappings           = file("${path.module}/table-mappings.json")
  cdc_start_time           = var.cdc_start_time

  tags = var.tags
}
