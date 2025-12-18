variable "agent_name" {
  description = "DataSync agent name"
  type        = string
}

variable "ip_address" {
  description = "IP address of the DataSync agent"
  type        = string
  default     = null
}

variable "security_group_arns" {
  description = "Security group ARNs for the agent"
  type        = list(string)
  default     = []
}

variable "subnet_arns" {
  description = "Subnet ARNs for the agent"
  type        = list(string)
  default     = []
}

variable "vpc_endpoint_id" {
  description = "VPC endpoint ID"
  type        = string
  default     = null
}

variable "private_link_endpoint" {
  description = "Private link endpoint"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags for the DataSync agent"
  type        = map(string)
  default     = {}
}
