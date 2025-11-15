variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
}

variable "airflow_environment_name" {
  description = "Name of the MWAA environment"
  type        = string
}

variable "dag_s3_path" {
  description = "S3 path to DAGs"
  type        = string
}

variable "source_bucket_arn" {
  description = "S3 bucket ARN for DAGs and plugins"
  type        = string
}

variable "execution_role_arn" {
  description = "IAM execution role ARN for MWAA"
  type        = string
}

variable "security_group_ids" {
  description = "Security group IDs for MWAA"
  type        = list(string)
}

variable "subnet_ids" {
  description = "Subnet IDs for MWAA"
  type        = list(string)
}

variable "airflow_version" {
  description = "Airflow version"
  type        = string
  default     = "3.0.6"
}

variable "environment_class" {
  description = "MWAA environment class"
  type        = string
  default     = "mw1.medium"
}

variable "max_workers" {
  description = "Maximum number of workers"
  type        = number
  default     = 10
}

variable "min_workers" {
  description = "Minimum number of workers"
  type        = number
  default     = 1
}

variable "schedulers" {
  description = "Number of schedulers"
  type        = number
  default     = 2
}

variable "max_webservers" {
  description = "Maximum number of webservers"
  type        = number
  default     = 2
}

variable "min_webservers" {
  description = "Minimum number of webservers"
  type        = number
  default     = 2
}

variable "weekly_maintenance_window_start" {
  description = "Weekly maintenance window start time"
  type        = string
  default     = "MON:03:30"
}

variable "webserver_access_mode" {
  description = "Webserver access mode (PUBLIC_ONLY or PRIVATE_ONLY)"
  type        = string
  default     = "PRIVATE_ONLY"
}

variable "worker_replacement_strategy" {
  description = "Worker replacement strategy (ROLLING_ON_FAILURE or FORCED)"
  type        = string
  default     = "ROLLING_ON_FAILURE"
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
  default     = {}
}
