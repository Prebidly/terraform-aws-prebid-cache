variable "config" {
  type = object({
    environment = string
    region      = string
    projectName = string
  })
  description = "Configuration object containing environment name, region name and the project name"
}

variable "vpc_id" {
  type        = string
  description = "Id of the VPC where resources should be deployed"
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources"
}
