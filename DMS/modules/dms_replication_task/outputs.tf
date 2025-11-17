output "replication_task_arn" {
  description = "Replication task ARN"
  value       = aws_dms_replication_task.this.replication_task_arn
}

output "replication_task_id" {
  description = "Replication task ID"
  value       = aws_dms_replication_task.this.replication_task_id
}

output "status" {
  description = "Replication task status"
  value       = aws_dms_replication_task.this.status
}
