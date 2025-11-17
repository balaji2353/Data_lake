locals {
  wg_configuration = { for k, v in var.workgroups : k => coalesce(lookup(v, "configuration", null), {}) }
}

resource "aws_athena_workgroup" "this" {
  for_each = var.workgroups

  name        = each.value.name
  description = lookup(each.value, "description", null)

  dynamic "configuration" {
    for_each = length(try(local.wg_configuration[each.key], {})) == 0 ? [] : [try(local.wg_configuration[each.key], {})]
    content {
      enforce_workgroup_configuration    = lookup(configuration.value, "enforce_workgroup_configuration", null)
      publish_cloudwatch_metrics_enabled = lookup(configuration.value, "publish_cloudwatch_metrics_enabled", null)
      requester_pays_enabled             = lookup(configuration.value, "requester_pays_enabled", null)
      bytes_scanned_cutoff_per_query     = lookup(configuration.value, "bytes_scanned_cutoff_per_query", null)
    }
  }

  tags = lookup(each.value, "tags", {})
}

