variable "workgroups" {
  description = "Map of workgroup objects to create. Each value is an object with keys: name (string), description (string, optional), configuration (map(any), optional), tags (map(string), optional)"
  type = map(object({
    name          = string
    description   = optional(string)
    configuration = optional(map(any))
    tags          = optional(map(string))
  }))
  default = {}
}
