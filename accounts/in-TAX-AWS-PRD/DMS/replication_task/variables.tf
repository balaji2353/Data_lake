variable "replication_task_id" {
	type = string
}

variable "migration_type" {
	type    = string
	default = "full-load-and-cdc"
}

variable "cdc_start_time" {
	type    = string
	default = null
}

variable "table_mappings_path" {
	type    = string
	default = "../prod/table-mappings.json"
}

variable "tags" {
	type    = map(string)
	default = {}
}

variable "replication_instance_arn" {
	type    = string
	default = ""
}

variable "source_endpoint_arn" {
	type    = string
	default = ""
}

variable "target_endpoint_arn" {
	type    = string
	default = ""
}
