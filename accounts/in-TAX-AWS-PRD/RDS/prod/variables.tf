variable "master_username" {
  description = "Master DB username (fallback to secret if null)"
  type        = string
  default     = null
}

variable "master_password" {
  description = "Master DB password (fallback to secret if null)"
  type        = string
  default     = null
}

variable "secrets_manager_secret_name" {
  description = "Optional Secrets Manager secret name containing JSON with username/password"
  type        = string
  default     = null
}
