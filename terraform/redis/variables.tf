variable "config" {
  type = object({
    environment = string
    region      = string
    projectName = string
  })
}

variable "engine_version" {
  type = string
}

variable "node_type" {
  type = string
}

variable "parameter_group_name" {
  type = string
}

variable "subnets" {
  type = list(string)
}

variable "cloudwatch_log_group" {
  type = string
}

variable "sg_id" {
  type = string
}

variable "tags" {
  type = map(string)
}
