variable "replication_task_id" {
  description = "Replication task identifier"
  type        = string
}

variable "replication_instance_arn" {
  description = "Replication instance ARN"
  type        = string
}

variable "source_endpoint_arn" {
  description = "Source endpoint ARN"
  type        = string
}

variable "target_endpoint_arn" {
  description = "Target endpoint ARN"
  type        = string
}

variable "migration_type" {
  description = "Migration type (full-load, cdc, full-load-and-cdc)"
  type        = string
  default     = "full-load-and-cdc"
}

variable "table_mappings" {
  description = "Table mappings JSON"
  type        = string
}

variable "cdc_start_time" {
  description = "CDC start time (ISO 8601 format)"
  type        = string
  default     = null
}

variable "start_replication_task" {
  description = "Start replication task after creation"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
  default     = {}
}
