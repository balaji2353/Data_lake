resource "aws_dms_endpoint" "source" {
  endpoint_id   = var.endpoint_id
  endpoint_type = "source"
  engine_name   = var.engine_name
  username      = var.username
  password      = var.password
  server_name   = var.server_name
  port          = var.port
  database_name = var.database_name

  tags = var.tags
}
