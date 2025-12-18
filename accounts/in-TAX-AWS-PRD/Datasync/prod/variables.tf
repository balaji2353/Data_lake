variable "rds_secret_name" {
  type    = string
  default = null
}

variable "dms_secret_name" {
  type    = string
  default = null
}

variable "agent_name" {
  type    = string
  default = null
}

variable "private_link_endpoint" {
  type    = string
  default = null
}

variable "vpc_endpoint_id" {
  type    = string
  default = null
}

variable "security_group_arns" {
  type    = list(string)
  default = []
}

variable "subnet_arns" {
  type    = list(string)
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}
