output "source_endpoints" {
  description = "Map of source endpoint metadata keyed by local key"
  value = {
    for k, m in module.source_endpoint : k => {
      endpoint_id  = m.endpoint_id
      endpoint_arn = m.endpoint_arn
    }
  }
}

output "target_endpoints" {
  description = "Map of target endpoint metadata keyed by local key"
  value = {
    for k, m in module.target_endpoint : k => {
      endpoint_id      = m.endpoint_id
      endpoint_arn     = m.endpoint_arn
      iam_role_arn     = try(m.iam_role_arn, null)
    }
  }
}

# Backwards compatible single-value outputs (null when multiple or none)
output "source_endpoint_arn" {
  description = "Single source endpoint ARN when exactly one source endpoint is configured"
  value       = length(keys(module.source_endpoint)) == 1 ? element(values(module.source_endpoint), 0).endpoint_arn : null
}

output "source_endpoint_id" {
  description = "Single source endpoint id when exactly one source endpoint is configured"
  value       = length(keys(module.source_endpoint)) == 1 ? element(values(module.source_endpoint), 0).endpoint_id : null
}

output "target_endpoint_arn" {
  description = "Single target endpoint ARN when exactly one target endpoint is configured"
  value       = length(keys(module.target_endpoint)) == 1 ? element(values(module.target_endpoint), 0).endpoint_arn : null
}

output "target_endpoint_id" {
  description = "Single target endpoint id when exactly one target endpoint is configured"
  value       = length(keys(module.target_endpoint)) == 1 ? element(values(module.target_endpoint), 0).endpoint_id : null
}

output "target_iam_role_arn" {
  description = "Single target iam role arn when exactly one target endpoint is configured"
  value       = length(keys(module.target_endpoint)) == 1 ? try(element(values(module.target_endpoint), 0).iam_role_arn, null) : null
}
