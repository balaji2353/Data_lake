// variables cleaned; definitions provided in module or other files
variable "source_endpoint_id" {
  description = "Identifier for the source endpoint"
  type        = string
  default     = null
}

variable "source_engine_name" {
  description = "Source engine (e.g., mysql, postgres)"
  type        = string
  default     = null
}

variable "source_server_name" {
  description = "Source server hostname or endpoint"
  type        = string
  default     = null
}

variable "source_port" {
  description = "Source server port"
  type        = number
  default     = null
}

variable "source_database_name" {
  description = "Source database/schema name"
  type        = string
  default     = null
}

variable "source_username" {
  description = "Source username; leave null when using Secrets Manager"
  type        = string
  sensitive   = true
  default     = null
}

variable "source_password" {
  description = "Source password; leave null when using Secrets Manager"
  type        = string
  sensitive   = true
  default     = null
}

variable "source_secrets_manager_secret_name" {
  description = "Optional Secrets Manager secret name (JSON with username/password) for the source endpoint"
  type        = string
  default     = null
}

variable "target_endpoint_id" {
  description = "Identifier for the target endpoint"
  type        = string
  default     = null
}

variable "target_bucket_name" {
  description = "S3 bucket name used by the target endpoint"
  type        = string
  default     = null
}

variable "target_iam_role_name" {
  description = "IAM role name for the DMS S3 target (optional)"
  type        = string
  default     = null
}

variable "replication_instance_id" {
  description = "Replication instance identifier"
  type        = string
  default     = null
}

variable "replication_instance_class" {
  description = "Replication instance class (e.g., dms.r5.large)"
  type        = string
  default     = null
}

variable "allocated_storage" {
  description = "Allocated storage for replication instance (GB)"
  type        = number
  default     = null
}

variable "engine_version" {
  description = "Engine version for replication instance (optional)"
  type        = string
  default     = null
}

variable "replication_task_id" {
  description = "Replication task id"
  type        = string
  default     = null
}

variable "migration_type" {
  description = "Migration type: full-load, cdc, full-load-and-cdc"
  type        = string
  default     = "full-load-and-cdc"
}

variable "cdc_start_time" {
  description = "CDC start time if applicable (ISO8601)"
  type        = string
  default     = null
}

variable "tags" {
  description = "Map of tags to apply"
  type        = map(string)
  default     = {}
}
