variable "source_endpoints" {
  description = "Map of source endpoint objects keyed by local name/id"
  type = map(object({
    endpoint_id   = string
    engine_name   = string
    username      = string
    password      = string
    server_name   = string
    port          = number
    database_name = string
    tags          = optional(map(string))
  }))
  default = {}
}

variable "target_endpoints" {
  description = "Map of target endpoint objects keyed by local name/id"
  type = map(object({
    endpoint_id   = string
    bucket_name   = string
    iam_role_name = string
    tags          = optional(map(string))
  }))
  default = {}
}

variable "tags" {
  description = "Default tags to apply to endpoints"
  type        = map(string)
  default     = {}
}

# Backwards compatibility: single endpoint variables (deprecated)
variable "source_endpoint_id" {
  description = "(Deprecated) Single source endpoint id"
  type        = string
  default     = ""
}

variable "source_engine_name" {
  description = "(Deprecated) Single source engine name"
  type        = string
  default     = ""
}

variable "source_username" {
  description = "(Deprecated) Single source username"
  type        = string
  default     = ""
}

variable "source_password" {
  description = "(Deprecated) Single source password"
  type        = string
  default     = ""
  sensitive   = true
}

variable "source_server_name" {
  description = "(Deprecated) Single source server name"
  type        = string
  default     = ""
}

variable "source_port" {
  description = "(Deprecated) Single source port"
  type        = number
  default     = 0
}

variable "source_database_name" {
  description = "(Deprecated) Single source database name"
  type        = string
  default     = ""
}

variable "target_endpoint_id" {
  description = "(Deprecated) Single target endpoint id"
  type        = string
  default     = ""
}

variable "target_bucket_name" {
  description = "(Deprecated) Single target bucket name"
  type        = string
  default     = ""
}

variable "target_iam_role_name" {
  description = "(Deprecated) Single target IAM role name"
  type        = string
  default     = ""
}
