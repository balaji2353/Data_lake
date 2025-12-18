output "cluster_id" {
  description = "RDS cluster ID"
  value       = module.rds.cluster_id
}

output "cluster_endpoint" {
  description = "RDS cluster endpoint"
  value       = module.rds.cluster_endpoint
}

output "cluster_arn" {
  description = "RDS cluster ARN"
  value       = module.rds.cluster_arn
}
