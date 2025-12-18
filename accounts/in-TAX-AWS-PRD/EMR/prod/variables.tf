variable "environment" {
  type = string
}

variable "application_name" {
  type = string
}

variable "release_label" {
  type = string
}

variable "application_type" {
  type = string
}

variable "maximum_capacity_cpu" {
  type = number
}

variable "maximum_capacity_memory" {
  type = number
}

variable "initial_capacity" {
  type = list(object({
    type        = string
    worker_count = number
    cpu         = number
    memory      = number
  }))
}

variable "tags" {
  type = map(string)
}
