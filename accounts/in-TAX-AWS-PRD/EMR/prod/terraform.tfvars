environment        = "prod"
application_name   = "dms-emr-prod"
release_label      = "emr-7.0.0"
application_type   = "SPARK"
maximum_capacity_cpu    = 200
maximum_capacity_memory = 2000
initial_capacity = [
  {
    type         = "DRIVER"
    worker_count = 2
    cpu          = 4
    memory       = 8
  },
  {
    type         = "EXECUTOR"
    worker_count = 2
    cpu          = 8
    memory       = 32
  }
]
tags = {
	Environment = "prod"
	Project     = "DMS Data Lake"
}
