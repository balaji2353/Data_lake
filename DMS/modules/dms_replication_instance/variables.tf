variable "replication_instance_id" {
  description = "Replication instance identifier"
  type        = string
}

variable "replication_instance_class" {
  description = "Replication instance class (e.g., dms.t3.micro, dms.c6i.8xlarge)"
  type        = string
  default     = "dms.t3.micro"
}

variable "allocated_storage" {
  description = "Allocated storage in GB"
  type        = number
  default     = 100
}

variable "engine_version" {
  description = "DMS engine version"
  type        = string
  default     = "3.5.4"
}

variable "publicly_accessible" {
  description = "Publicly accessible"
  type        = bool
  default     = false
}

variable "multi_az" {
  description = "Multi-AZ deployment"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
  default     = {}
}
