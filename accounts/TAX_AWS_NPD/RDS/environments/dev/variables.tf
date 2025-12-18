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
  description = "Master username"
  type        = string
  default     = "postgres"
  sensitive   = true
}

variable "master_password" {
  description = "Master password"
  type        = string
  sensitive   = true
}

variable "skip_final_snapshot" {
  description = "Skip final snapshot"
  type        = bool
  default     = true
}

variable "backup_retention_period" {
  description = "Backup retention period"
  type        = number
  default     = 7
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
  default     = false
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
  default     = {}
}
