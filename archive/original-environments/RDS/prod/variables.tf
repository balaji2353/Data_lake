variable "cluster_identifier" {
  description = "RDS cluster identifier"
  type        = string
}

variable "engine" {
  description = "Database engine"
  type        = string
  default     = "aurora-postgresql"
}

variable "engine_version" {
  description = "Database engine version"
  type        = string
  default     = "15.4"
}

variable "master_username" {
  description = "Master username (override). If null, read from Secrets Manager secret."
  type        = string
  default     = null
  sensitive   = true
}

variable "master_password" {
  description = "Master password (only used if manage_master_user_password is false)"
  type        = string
  default     = null
  sensitive   = true
}

variable "manage_master_user_password" {
  description = "Set to true to allow RDS to manage the master user password in Secrets Manager"
  type        = bool
  default     = true
}

variable "skip_final_snapshot" {
  description = "Skip final snapshot"
  type        = bool
  default     = false
}

variable "backup_retention_period" {
  description = "Backup retention period"
  type        = number
  default     = 30
}

variable "preferred_backup_window" {
  description = "Preferred backup window"
  type        = string
  default     = "03:00-04:00"
}

variable "enabled_cloudwatch_logs_exports" {
  description = "CloudWatch logs to export"
  type        = list(string)
  default     = []
}

variable "deletion_protection" {
  description = "Enable deletion protection"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
  default     = {}
}

variable "secrets_manager_secret_name" {
  description = "Secrets Manager secret id/name for RDS credentials (JSON with 'username' and 'password')"
  type        = string
  default     = "rds/prod/credentials"
}
