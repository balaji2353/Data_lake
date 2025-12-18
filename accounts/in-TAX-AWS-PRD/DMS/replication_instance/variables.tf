variable "replication_instance_id" { type = string }
variable "replication_instance_class" { type = string }
variable "allocated_storage" { type = number }
variable "engine_version" { type = string }
variable "tags" { type = map(string) }

variable "tags_json" {
	description = "Optional tags as JSON string (for ease of CLI passing)."
	type        = string
	default     = ""
}
