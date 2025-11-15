resource "aws_redshiftserverless_workgroup" "this" {
  namespace_name = var.namespace_name
  workgroup_name = var.workgroup_name
  tags           = var.tags

  dynamic "config_parameter" {
    for_each = var.config_parameters
    content {
      parameter_key   = config_parameter.value.parameter_key
      parameter_value = config_parameter.value.parameter_value
    }
  }

  dynamic "price_performance_target" {
    for_each = var.price_performance_target == null ? [] : [var.price_performance_target]
    content {
      enabled = price_performance_target.value.enabled
      level   = price_performance_target.value.level
    }
  }

  security_group_ids = length(var.security_group_ids) > 0 ? var.security_group_ids : null
  subnet_ids         = length(var.subnet_ids) > 0 ? var.subnet_ids : null
}
