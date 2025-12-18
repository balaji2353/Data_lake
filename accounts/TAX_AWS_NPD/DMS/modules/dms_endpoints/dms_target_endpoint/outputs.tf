output "endpoint_id" {
  description = "Target endpoint ID"
  value       = aws_dms_s3_endpoint.target.endpoint_id
}

output "endpoint_arn" {
  description = "Target endpoint ARN"
  value       = aws_dms_s3_endpoint.target.endpoint_arn
}

output "iam_role_arn" {
  description = "IAM role ARN used by the target endpoint"
  value       = var.existing_role_arn != "" ? var.existing_role_arn : aws_iam_role.s3_target_role[0].arn
}

output "bucket_name" {
  description = "S3 bucket name"
  value       = aws_dms_s3_endpoint.target.bucket_name
}
