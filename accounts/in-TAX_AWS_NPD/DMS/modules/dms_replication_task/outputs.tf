output "replication_task_arns" {
  description = "Map of replication task ARNs keyed by replication_task_id"
  value       = { for k, v in aws_dms_replication_task.this : k => v.replication_task_arn }
}

output "replication_task_statuses" {
  description = "Map of replication task statuses keyed by replication_task_id"
  value       = { for k, v in aws_dms_replication_task.this : k => v.status }
}

output "replication_task_ids" {
  description = "List of replication task ids created"
  value       = keys(aws_dms_replication_task.this)
}

# Backwards compatible single outputs (null when multiple or none)
output "replication_task_arn" {
  description = "Single replication task ARN when exactly one task is configured"
  value       = length(keys(aws_dms_replication_task.this)) == 1 ? element(values(aws_dms_replication_task.this), 0).replication_task_arn : null
}

output "replication_task_status" {
  description = "Single replication task status when exactly one task is configured"
  value       = length(keys(aws_dms_replication_task.this)) == 1 ? element(values(aws_dms_replication_task.this), 0).status : null
}

output "replication_task_id" {
  description = "Single replication task id when exactly one task is configured"
  value       = length(keys(aws_dms_replication_task.this)) == 1 ? element(keys(aws_dms_replication_task.this), 0) : null
}
