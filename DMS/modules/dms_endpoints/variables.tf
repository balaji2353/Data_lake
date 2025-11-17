variable "source_endpoint_id" {
  description = "Source endpoint identifier"
  type        = string
}

variable "source_engine_name" {
  description = "Source database engine"
  type        = string
}

variable "source_username" {
  description = "Source database username"
  type        = string
}

variable "source_password" {
  description = "Source database password"
  type        = string
  sensitive   = true
}

variable "source_server_name" {
  description = "Source database server"
  type        = string
}

variable "source_port" {
  description = "Source database port"
  type        = number
}

variable "source_database_name" {
  description = "Source database name"
  type        = string
}

variable "target_endpoint_id" {
  description = "Target endpoint identifier"
  type        = string
}

variable "target_bucket_name" {
  description = "Target S3 bucket name"
  type        = string
}

variable "target_iam_role_name" {
  description = "IAM role name for target endpoint"
  type        = string
}

variable "tags" {
  description = "Tags to apply to endpoints"
  type        = map(string)
  default     = {}
}
