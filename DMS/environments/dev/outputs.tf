output "source_endpoint_arn" {
  description = "Source endpoint ARN"
  value       = module.endpoints.source_endpoint_arn
}

output "target_endpoint_arn" {
  description = "Target endpoint ARN"
  value       = module.endpoints.target_endpoint_arn
}

output "replication_instance_arn" {
  description = "Replication instance ARN"
  value       = module.replication_instance.replication_instance_arn
}

output "replication_task_arn" {
  description = "Replication task ARN"
  value       = module.replication_task.replication_task_arn
}

output "replication_task_status" {
  description = "Replication task status"
  value       = module.replication_task.status
}
