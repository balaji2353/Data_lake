resource "aws_datasync_agent" "this" {
  name                  = var.agent_name
  ip_address            = var.ip_address
  security_group_arns   = var.security_group_arns
  subnet_arns           = var.subnet_arns
  vpc_endpoint_id       = var.vpc_endpoint_id
  private_link_endpoint = var.private_link_endpoint

  tags = var.tags
}
