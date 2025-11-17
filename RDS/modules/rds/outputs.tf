output "cluster_id" {
  description = "RDS cluster ID"
  value       = aws_rds_cluster.this.id
}

output "cluster_identifier" {
  description = "RDS cluster identifier"
  value       = aws_rds_cluster.this.cluster_identifier
}

output "cluster_endpoint" {
  description = "RDS cluster endpoint"
  value       = aws_rds_cluster.this.endpoint
}

output "cluster_arn" {
  description = "RDS cluster ARN"
  value       = aws_rds_cluster.this.arn
}
