variable "agent_name" {
  description = "DataSync agent name"
  type        = string
}

variable "private_link_endpoint" {
  description = "Private link endpoint"
  type        = string
}

variable "vpc_endpoint_id" {
  description = "VPC endpoint ID"
  type        = string
}

variable "security_group_arns" {
  description = "Security group ARNs"
  type        = list(string)
}

variable "subnet_arns" {
  description = "Subnet ARNs"
  type        = list(string)
}

variable "rds_secret_name" {
  description = "Secrets Manager secret name for RDS credentials (optional)"
  type        = string
  default     = "datasync/prod/rds_credentials"
}

variable "dms_secret_name" {
  description = "Secrets Manager secret name for DMS credentials (optional)"
  type        = string
  default     = "datasync/prod/dms_credentials"
}
