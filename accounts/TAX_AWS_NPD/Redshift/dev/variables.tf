variable "namespace_name" {
  description = "Redshift namespace for dev"
  type        = string
}

variable "workgroup_name" {
  description = "Redshift workgroup name for dev"
  type        = string
}

variable "tags" {
  description = "Tags for dev environment"
  type        = map(string)
  default     = {}
}
