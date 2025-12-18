variable "replication_instance_id" { type = string }
variable "replication_instance_class" { type = string }
variable "allocated_storage" { type = number }
variable "engine_version" { type = string }
variable "tags" {
	type    = map(string)
	default = {}
}
