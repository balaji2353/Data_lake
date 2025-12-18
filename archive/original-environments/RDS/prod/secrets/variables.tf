variable "rds_secret_name" {
  description = "Secrets Manager secret name for RDS credentials"
  type        = string
  default     = "rds/prod/credentials"
}

variable "rds_secret_string" {
  description = "JSON string for RDS secret e.g. '{\"username\":\"postgres\",\"password\":\"...\"}' (sensitive)"
  type        = string
  sensitive   = true
  default     = null
}

variable "kms_key_id" {
  description = "Optional KMS key ARN or ID to encrypt secrets. If null, AWS Secrets Manager default KMS key is used."
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags applied to created secrets"
  type        = map(string)
  default     = { ManagedBy = "Terraform" }
}
