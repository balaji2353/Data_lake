variable "source_endpoint_id" {
  description = "Source endpoint identifier"
  type        = string
}

variable "source_engine_name" {
  description = "Source database engine"
  type        = string
  default     = "sqlserver"
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
  default     = 1433
}

variable "source_database_name" {
  description = "Source database name"
  type        = string
}

variable "target_endpoint_id" {
  description = "Target endpoint identifier (S3)"
  type        = string
}

variable "target_bucket_name" {
  description = "Target S3 bucket name"
  type        = string
}

variable "target_iam_role_name" {
  description = "IAM role name for target endpoint"
  type        = string
  default     = "dms-s3-target-role"
}

variable "replication_instance_id" {
  description = "Replication instance identifier"
  type        = string
}

variable "replication_instance_class" {
  description = "Replication instance class"
  type        = string
  default     = "dms.c6i.8xlarge"
}

variable "allocated_storage" {
  description = "Allocated storage in GB"
  type        = number
  default     = 200
}

variable "engine_version" {
  description = "DMS engine version"
  type        = string
  default     = "3.5.4"
}

variable "replication_task_id" {
  description = "Replication task identifier"
  type        = string
}

variable "migration_type" {
  description = "Migration type"
  type        = string
  default     = "full-load-and-cdc"
}

variable "cdc_start_time" {
  description = "CDC start time (ISO 8601)"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default = {
    Environment = "prod"
  }
}
