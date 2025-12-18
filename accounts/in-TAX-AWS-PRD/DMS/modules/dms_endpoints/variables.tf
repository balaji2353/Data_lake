variable "source_endpoints" {
	type    = map(any)
	default = {}
}

variable "target_endpoints" {
	type    = map(any)
	default = {}
}

variable "secrets_manager_secret_name" {
	type    = string
	default = null
}

variable "tags" {
	type    = map(string)
	default = {}
}
