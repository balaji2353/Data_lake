output "endpoint_id" {
  value = var.endpoint_id
}

output "endpoint_arn" {
  value = "arn:aws:dms:::endpoint/${var.endpoint_id}"
}

output "engine_name" {
  value = var.engine_name
}
