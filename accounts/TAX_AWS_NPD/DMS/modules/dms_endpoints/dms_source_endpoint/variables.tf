variable "endpoint_id" {
  description = "Endpoint identifier"
  type        = string
}

variable "engine_name" {
  description = "Database engine (e.g., sqlserver, postgres, mysql)"
  type        = string
}

variable "username" {
  description = "Database username"
  type        = string
  default     = null
}

variable "password" {
  description = "Database password"
  type        = string
  sensitive   = true
  default     = null
}

variable "secrets_manager_secret_name" {
  description = "Optional Secrets Manager secret id/name to read username/password from (JSON with 'username' and 'password')"
  type        = string
  default     = null
}

variable "server_name" {
  description = "Database server hostname or IP"
  type        = string
}

variable "port" {
  description = "Database port"
  type        = number
}

variable "database_name" {
  description = "Database name"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the endpoint"
  type        = map(string)
  default     = {}
}
