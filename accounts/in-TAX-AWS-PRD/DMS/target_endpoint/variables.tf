variable "endpoint_id" {
	type = string
}

variable "bucket_name" {
	type = string
}

variable "iam_role_name" {
	type = string
}

variable "existing_role_arn" {
	type    = string
	default = null
}

variable "tags" {
	type    = map(string)
	default = {}
}
