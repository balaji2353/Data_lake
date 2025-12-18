output "application_id" {
  description = "EMR Serverless Application ID"
  value       = module.emr_serverless.application_id
}

output "application_arn" {
  description = "EMR Serverless Application ARN"
  value       = module.emr_serverless.application_arn
}

output "application_name" {
  description = "EMR Serverless Application Name"
  value       = module.emr_serverless.application_name
}

output "creation_time" {
  description = "Creation time of the application"
  value       = ""
}
