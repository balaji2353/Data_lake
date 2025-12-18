output "airflow_environment_arn" {
  description = "ARN of the MWAA environment"
  value       = aws_mwaa_environment.airflow.arn
}

output "airflow_environment_id" {
  description = "ID of the MWAA environment"
  value       = aws_mwaa_environment.airflow.id
}

output "webserver_url" {
  description = "Webserver URL for the MWAA environment"
  value       = aws_mwaa_environment.airflow.webserver_url
}

output "status" {
  description = "Status of the MWAA environment"
  value       = aws_mwaa_environment.airflow.status
}
