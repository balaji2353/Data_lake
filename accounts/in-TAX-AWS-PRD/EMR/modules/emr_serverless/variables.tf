variable "environment" {
  description = "Environment name (dev, prod)"
  type        = string
}

variable "application_name" {
  description = "Name of the EMR Serverless application"
  type        = string
}

variable "release_label" {
  description = "EMR release label (e.g., emr-7.0.0)"
  type        = string
  default     = "emr-7.0.0"
}

variable "application_type" {
  description = "Type of application (SPARK, HIVE)"
  type        = string
  default     = "SPARK"
}

variable "maximum_capacity_cpu" {
  description = "Maximum CPU capacity"
  type        = string
  default     = "100"
}

variable "maximum_capacity_memory" {
  description = "Maximum memory capacity in GB"
  type        = string
  default     = "1000"
}

variable "initial_capacity" {
  description = "Initial capacity configuration for DRIVER and EXECUTOR"
  type = list(object({
    type         = string  # DRIVER or EXECUTOR
    worker_count = number
    cpu          = string
    memory       = string
  }))
  default = [
    {
      type         = "DRIVER"
      worker_count = 1
      cpu          = "2"
      memory       = "4g"
    },
    {
      type         = "EXECUTOR"
      worker_count = 1
      cpu          = "4"
      memory       = "16g"
    }
  ]
}

variable "tags" {
  description = "Tags for the EMR application"
  type        = map(string)
  default     = {}
}
