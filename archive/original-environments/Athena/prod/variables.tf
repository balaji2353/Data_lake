variable "name" {
  description = "Athena workgroup name for prod"
  type        = string
}

variable "description" {
  description = "Optional description"
  type        = string
  default     = null
}

variable "configuration" {
  description = "Optional configuration map"
  type        = map(any)
  default     = {}
}

variable "tags" {
  description = "Tags for prod"
  type        = map(string)
  default     = {}
}

variable "workgroups" {
  description = "Map of workgroups to create in this environment (prod)"
  type = map(object({
    name          = string
    description   = optional(string)
    configuration = optional(map(any))
    tags          = optional(map(string))
  }))
  default = {}
}
