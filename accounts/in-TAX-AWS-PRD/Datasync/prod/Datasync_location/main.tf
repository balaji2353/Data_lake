resource "aws_datasync_agent" "Bolton-NPD-DataSync-Agent" {
  ip_address = var.ip_address
  name       = var.name
  security_group_arns = var.security_group_arns
}
