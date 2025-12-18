variable "cluster_identifier" {
  description = "RDS cluster identifier"
  type        = string
}

variable "engine" {
  description = "Database engine (e.g., postgres, mysql)"
  type        = string
  default     = "postgres"
}

variable "engine_version" {
  description = "Database engine version"
  type        = string
  default     = "15.4"
}

variable "master_username" {
  description = "Master username for database"
  type        = string
  default     = "postgres"
  sensitive   = true
}

variable "master_password" {
  description = "Master password for database (only used if manage_master_user_password is false)"
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
  description = "Skip final snapshot on deletion"
  type        = bool
  default     = false
}

variable "backup_retention_period" {
  description = "Backup retention period in days"
  type        = number
  default     = 30
}

variable "preferred_backup_window" {
  description = "Preferred backup window"
  type        = string
  default     = "03:00-04:00"
}

variable "enabled_cloudwatch_logs_exports" {
  description = "List of log types to export to CloudWatch"
  type        = list(string)
  default     = []
}

variable "deletion_protection" {
  description = "Enable deletion protection"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags for the RDS cluster"
  type        = map(string)
  default     = {}
}
