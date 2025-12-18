output "names" {
  description = "Map of workgroup names by key"
  value = { for k, v in aws_athena_workgroup.this : k => v.name }
}

output "arns" {
  description = "Map of workgroup ARNs by key"
  value = { for k, v in aws_athena_workgroup.this : k => v.arn }
}

output "states" {
  description = "Map of workgroup states by key"
  value = { for k, v in aws_athena_workgroup.this : k => v.state }
}
