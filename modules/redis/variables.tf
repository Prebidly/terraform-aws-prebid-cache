variable "config" {
  type = object({
    environment = string
    region      = string
    projectName = string
  })
  description = "Configuration object containing environment name, region name and the project name"
}

variable "engine_version" {
  type = string
  description = "Redis engine version number"
}

variable "node_type" {
  type = string
  description = "Redis node type"
}

variable "parameter_group_name" {
  type = string
  description = "Redis parameter group name. Should be aligned with the redis engine version"
}

variable "subnets" {
  type = list(string)
  description = "List of subnet IDs associated with the VPC"
}

variable "cloudwatch_log_group" {
  type = string
  description = "Cloudwatch log group name"
}

variable "sg_id" {
  type = string
  description = "Security group id"
}

variable "tags" {
  type = map(string)
  description = "A map of tags to add to all resources"
}
