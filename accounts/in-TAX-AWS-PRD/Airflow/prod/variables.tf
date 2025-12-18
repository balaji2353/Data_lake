variable "environment" {
  type = string
}

variable "airflow_environment_name" {
  type = string
}

variable "dag_s3_path" {
  type = string
}

variable "source_bucket_arn" {
  type = string
}

variable "execution_role_arn" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "subnet_ids" {
  type = list(string)
}

variable "environment_class" {
  type = string
}

variable "max_workers" {
  type = number
}

variable "min_workers" {
  type = number
}

variable "tags" {
  type = map(string)
}
