variable "namespace_name" {
  description = "Redshift namespace for prod"
  type        = string
}

variable "workgroup_name" {
  description = "Redshift workgroup name for prod"
  type        = string
}

variable "tags" {
  description = "Tags for prod environment"
  type        = map(string)
  default     = {}
}
