variable "replication_tasks" {
  description = "Map of replication task objects keyed by replication_task_id"
  type = map(object({
    replication_instance_arn = string
    source_endpoint_arn      = string
    target_endpoint_arn      = string
    table_mappings           = string
    migration_type           = optional(string)
    cdc_start_time           = optional(string)
    start_replication_task   = optional(bool)
    tags                     = optional(map(string))
  }))
  default = {}
}

variable "replication_task_id" {
  description = "(Deprecated) Single replication task id for backward compatibility"
  type        = string
  default     = ""
}

variable "replication_instance_arn" {
  description = "(Deprecated) Single replication instance ARN"
  type        = string
  default     = ""
}

variable "source_endpoint_arn" {
  description = "(Deprecated) Single source endpoint ARN"
  type        = string
  default     = ""
}

variable "target_endpoint_arn" {
  description = "(Deprecated) Single target endpoint ARN"
  type        = string
  default     = ""
}

variable "migration_type" {
  description = "(Deprecated) Single replication migration type"
  type        = string
  default     = "full-load-and-cdc"
}

variable "table_mappings" {
  description = "(Deprecated) Single table mappings JSON"
  type        = string
  default     = ""
}

variable "cdc_start_time" {
  description = "(Deprecated) Single CDC start time"
  type        = string
  default     = null
}

variable "start_replication_task" {
  description = "(Deprecated) Start replication task after creation"
  type        = bool
  default     = false
}

variable "tags" {
  description = "(Deprecated) Tags to apply for single-task usage"
  type        = map(string)
  default     = {}
}
