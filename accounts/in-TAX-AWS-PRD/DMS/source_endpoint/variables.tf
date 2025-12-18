variable "endpoint_id" {
	type = string
}

variable "engine_name" {
	type = string
	default = null
}

variable "username" {
	type = string
	default = null
}

variable "password" {
	type      = string
	sensitive = true
	default   = null
}

variable "secrets_manager_secret_name" {
	type    = string
	default = null
}

variable "server_name" {
	type = string
}

variable "port" {
	type = number
}

variable "database_name" {
	type = string
	default = null
}

variable "tags" {
	type    = map(string)
	default = {}
}
