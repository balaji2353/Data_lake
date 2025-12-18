variable "ip_address" {
  description = "IP address for the DataSync agent"
  type        = string
}

variable "name" {
  description = "Name for the DataSync agent"
  type        = string
}

variable "security_group_arns" {
  description = "List of security group ARNs to attach to the agent"
  type        = list(string)
  default     = []
}
