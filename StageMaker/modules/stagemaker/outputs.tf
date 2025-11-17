output "stagemaker_role_arn" {
  description = "SageMaker execution role ARN"
  value       = var.sagemaker_execution_role_arn
}

output "stagemaker_endpoint_name" {
  description = "Name of the SageMaker endpoint (if created)"
  value       = "${var.project_name}-endpoint"
}

output "tags" {
  description = "Tags applied"
  value       = var.tags
}
