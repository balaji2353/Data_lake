resource "null_resource" "replication_task" {
  for_each = var.replication_tasks
}

output "replication_task_arn" {
  value = { for k, r in var.replication_tasks : k => "arn:aws:dms:::replication-task/${k}" }
}
