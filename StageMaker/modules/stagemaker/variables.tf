variable "project_name" {
  description = "Project or namespace name"
  type        = string
}

variable "sagemaker_execution_role_arn" {
  description = "IAM role ARN for SageMaker execution"
  type        = string
}

variable "instance_type" {
  description = "Instance type for training / endpoint"
  type        = string
  default     = "ml.t3.medium"
}

variable "subnet_ids" {
  description = "Optional list of subnet IDs"
  type        = list(string)
  default     = []
}

variable "security_group_ids" {
  description = "Optional list of security group IDs"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
