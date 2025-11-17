output "replication_instance_arn" {
  description = "Replication instance ARN"
  value       = aws_dms_replication_instance.this.replication_instance_arn
}

output "replication_instance_id" {
  description = "Replication instance ID"
  value       = aws_dms_replication_instance.this.replication_instance_id
}
