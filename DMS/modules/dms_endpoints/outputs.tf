output "source_endpoint_id" {
  description = "Source endpoint ID"
  value       = module.source_endpoint.endpoint_id
}

output "source_endpoint_arn" {
  description = "Source endpoint ARN"
  value       = module.source_endpoint.endpoint_arn
}

output "target_endpoint_id" {
  description = "Target endpoint ID"
  value       = module.target_endpoint.endpoint_id
}

output "target_endpoint_arn" {
  description = "Target endpoint ARN"
  value       = module.target_endpoint.endpoint_arn
}

output "target_iam_role_arn" {
  description = "Target endpoint IAM role ARN"
  value       = module.target_endpoint.iam_role_arn
}
