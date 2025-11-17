variable "cluster_identifier" {
  description = "RDS cluster identifier"
  type        = string
}

variable "engine" {
  description = "Database engine (e.g., aurora-postgresql, aurora-mysql)"
  type        = string
  default     = "aurora-postgresql"
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
  description = "Master password for database"
  type        = string
  sensitive   = true
}

variable "skip_final_snapshot" {
  description = "Skip final snapshot on deletion"
  type        = bool
  default     = false
}

variable "backup_retention_period" {
  description = "Backup retention period in days"
  type        = number
  default     = 7
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
  default     = false
}

variable "tags" {
  description = "Tags for the RDS cluster"
  type        = map(string)
  default     = {}
}
