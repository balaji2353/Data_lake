output "id" {
  description = "Redshift workgroup id"
  value       = module.redshift.id
}

output "workgroup_name" {
  description = "Redshift workgroup name"
  value       = module.redshift.workgroup_name
}

output "namespace_name" {
  description = "Redshift namespace"
  value       = module.redshift.namespace_name
}
