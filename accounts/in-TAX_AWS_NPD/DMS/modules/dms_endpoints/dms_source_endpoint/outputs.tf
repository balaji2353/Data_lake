output "endpoint_id" {
  description = "Source endpoint ID"
  value       = aws_dms_endpoint.source.endpoint_id
}

output "endpoint_arn" {
  description = "Source endpoint ARN"
  value       = aws_dms_endpoint.source.endpoint_arn
}

output "engine_name" {
  description = "Engine name of the source endpoint"
  value       = aws_dms_endpoint.source.engine_name
}
