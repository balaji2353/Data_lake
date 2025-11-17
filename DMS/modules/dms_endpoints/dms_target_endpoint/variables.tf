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

variable "tags" {
  description = "Tags to apply to the endpoint and IAM resources"
  type        = map(string)
  default     = {}
}
