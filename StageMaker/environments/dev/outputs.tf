output "stagemaker_endpoint" {
  description = "Endpoint name or ARN created in this environment"
  value       = module.stagemaker.stagemaker_endpoint_name
}

output "stagemaker_role_arn" {
  description = "Execution role ARN used by SageMaker in this environment"
  value       = module.stagemaker.stagemaker_role_arn
}
