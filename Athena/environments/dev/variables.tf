variable "name" {
  description = "Athena workgroup name for dev"
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
  description = "Tags for dev"
  type        = map(string)
  default     = {}
}

variable "secondary_name" {
  description = "Optional second Athena workgroup name for dev"
  type        = string
  default     = null
}

variable "secondary_description" {
  description = "Optional description for second workgroup"
  type        = string
  default     = null
}

variable "secondary_configuration" {
  description = "Optional configuration map for second workgroup"
  type        = map(any)
  default     = {}
}

variable "secondary_tags" {
  description = "Tags for second workgroup"
  type        = map(string)
  default     = {}
}

variable "workgroups" {
  description = "Map of workgroups to create in this environment"
  type = map(object({
    name          = string
    description   = optional(string)
    configuration = optional(map(any))
    tags          = optional(map(string))
  }))
  default = {}
}
