module "source_endpoint" {
  source = "./dms_source_endpoint"

  endpoint_id   = var.source_endpoint_id
  engine_name   = var.source_engine_name
  username      = var.source_username
  password      = var.source_password
  server_name   = var.source_server_name
  port          = var.source_port
  database_name = var.source_database_name

  tags = var.tags
}

module "target_endpoint" {
  source = "./dms_target_endpoint"

  endpoint_id    = var.target_endpoint_id
  bucket_name    = var.target_bucket_name
  iam_role_name  = var.target_iam_role_name

  tags = var.tags
}
