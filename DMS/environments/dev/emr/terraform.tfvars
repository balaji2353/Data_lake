environment        = "dev"
application_name   = "dms-emr-dev"
release_label      = "emr-7.0.0"
application_type   = "SPARK"
maximum_capacity_cpu    = "100"
maximum_capacity_memory = "1000"
initial_capacity = [
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
tags = {
	Environment = "dev"
	Project     = "DMS Data Lake"
}
