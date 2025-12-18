variable "namespace_name" {
  type    = string
  default = ""
}

variable "workgroup_name" {
  type    = string
  default = ""
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "secrets_manager_secret_name" {
  description = "Optional Secrets Manager secret name (JSON) containing namespace_name and workgroup_name"
  type        = string
  default     = null
}

