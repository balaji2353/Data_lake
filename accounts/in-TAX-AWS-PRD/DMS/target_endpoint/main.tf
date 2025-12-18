module "target_endpoint" {
  source = "../modules/dms_endpoints/dms_target_endpoint"

  endpoint_id   = var.endpoint_id
  bucket_name   = var.bucket_name
  iam_role_name = var.iam_role_name
  existing_role_arn = var.existing_role_arn

  tags = var.tags
}

output "endpoint_id" { value = module.target_endpoint.endpoint_id }
output "endpoint_arn" { value = module.target_endpoint.endpoint_arn }
