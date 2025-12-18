variable "replication_tasks" {
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

variable "tags" {
  type    = map(string)
  default = {}
}
