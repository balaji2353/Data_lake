output "id" {
  description = "ID of the Redshift Serverless workgroup"
  value       = aws_redshiftserverless_workgroup.this.id
}

output "workgroup_name" {
  description = "Name of the Redshift Serverless workgroup"
  value       = aws_redshiftserverless_workgroup.this.workgroup_name
}

output "namespace_name" {
  description = "Namespace the workgroup belongs to"
  value       = aws_redshiftserverless_workgroup.this.namespace_name
}

output "security_group_ids" {
  description = "Security group IDs attached to the workgroup (if any)"
  value       = aws_redshiftserverless_workgroup.this.security_group_ids
}

output "subnet_ids" {
  description = "Subnet IDs attached to the workgroup (if any)"
  value       = aws_redshiftserverless_workgroup.this.subnet_ids
}
