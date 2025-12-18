output "replication_instance_id" { value = var.replication_instance_id }
output "replication_instance_arn" { value = "arn:aws:dms:::replication-instance/${var.replication_instance_id}" }
