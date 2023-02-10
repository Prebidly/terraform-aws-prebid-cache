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

variable "subnets" {
  type        = list(string)
  description = "List of subnet IDs associated with the VPC"
}

variable "lb_target_group_arn" {
  type        = string
  description = "ARN of the load balancer target group"
}
