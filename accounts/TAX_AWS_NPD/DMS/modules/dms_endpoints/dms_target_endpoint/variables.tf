variable "endpoint_id" {
  description = "Endpoint identifier"
  type        = string
}

variable "bucket_name" {
  description = "S3 bucket name for target endpoint"
  type        = string
}

variable "iam_role_name" {
  description = "IAM role name for S3 access"
  type        = string
}

variable "existing_role_arn" {
  description = "Optional existing IAM role ARN to use instead of creating a new role"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply to the endpoint and IAM resources"
  type        = map(string)
  default     = {}
}
