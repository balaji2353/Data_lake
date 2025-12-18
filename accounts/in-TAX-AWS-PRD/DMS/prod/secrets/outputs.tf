output "secrets_manager_secret_arn" {
  description = "ARN of the Secrets Manager secret"
  value       = aws_secretsmanager_secret.dms_secret.arn
}
output "secret_arn" {
  value       = aws_secretsmanager_secret.this.arn
  description = "ARN of the created secret"
}

output "secret_name" {
  value       = aws_secretsmanager_secret.this.name
  description = "Name of the created secret"
}
