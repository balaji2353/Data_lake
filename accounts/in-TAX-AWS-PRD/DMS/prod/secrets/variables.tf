variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "secret_name" {
  description = "Name of the Secrets Manager secret to create or update"
  type        = string
  default     = "dms/prod/credentials"
}

variable "secret_string" {
  description = "Secret JSON string (sensitive). Example: {\"username\":\"user\",\"password\":\"pw\",\"engine\":\"sqlserver\",\"database\":\"db\" }"
  type      = string
  sensitive = true
  default   = null
}
variable "secret_name" {
  description = "Secrets Manager secret name to create"
  type        = string
  default     = "dms/prod/credentials"
}

variable "username" {
  description = "Initial username to store in the secret (nullable)"
  type        = string
  sensitive   = true
  default     = null
}

variable "password" {
  description = "Initial password to store in the secret (nullable)"
  type        = string
  sensitive   = true
  default     = null
}

variable "kms_key_id" {
  description = "Optional KMS key id/arn for encryption"
  type        = string
  default     = null
}

variable "prevent_destroy" {
  description = "Whether to prevent destroy of the secret"
  type        = bool
  default     = true
}
