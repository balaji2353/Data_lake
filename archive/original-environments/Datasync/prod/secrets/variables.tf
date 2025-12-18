variable "tags" {
  description = "Tags applied to created secrets"
  type        = map(string)
  default     = { ManagedBy = "Terraform" }
}

variable "kms_key_id" {
  description = "Optional KMS key ARN or ID to encrypt secrets. If null, AWS Secrets Manager default KMS key is used."
  type        = string
  default     = null
}

variable "dms_secret_name" {
  description = "Secrets Manager secret name for DMS credentials"
  type        = string
  default     = "datasync/prod/dms_credentials"
}

variable "dms_secret_string" {
  description = "JSON string for DMS secret e.g. '{\"username\":\"user\",\"password\":\"...\"}' (sensitive)"
  type        = string
  sensitive   = true
  default     = null
}
