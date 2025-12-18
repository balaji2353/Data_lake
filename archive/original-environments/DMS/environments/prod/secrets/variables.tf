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
