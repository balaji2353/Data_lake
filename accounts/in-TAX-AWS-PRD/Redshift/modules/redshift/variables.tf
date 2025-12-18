variable "namespace_name" {
  description = "Redshift Serverless namespace name"
  type        = string
}

variable "workgroup_name" {
  description = "Redshift Serverless workgroup name"
  type        = string
}

variable "tags" {
  description = "Map of tags to apply to the workgroup"
  type        = map(string)
  default     = {}
}

variable "security_group_ids" {
  description = "Optional list of security group IDs for the workgroup VPC endpoints"
  type        = list(string)
  default     = []
}

variable "subnet_ids" {
  description = "Optional list of subnet IDs for the workgroup VPC endpoints"
  type        = list(string)
  default     = []
}

variable "config_parameters" {
  description = "Optional list of config parameter objects ({ parameter_key, parameter_value })"
  type = list(object({
    parameter_key   = string
    parameter_value = string
  }))
  default = []
}

variable "price_performance_target" {
  description = "Optional price_performance_target block ({ enabled = bool, level = number })"
  type = object({
    enabled = bool
    level   = number
  })
  default = null
}
