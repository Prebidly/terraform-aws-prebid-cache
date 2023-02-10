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

variable "ec2_instance_type" {
  type        = string
  default     = "t2.micro"
  description = "EC2 instance type the prebid cache application will be running on"
}

variable "redis_engine_version" {
  type        = string
  default     = "6.2"
  description = "Redis engine version number"
}

variable "redis_node_type" {
  type        = string
  default     = "cache.t2.small"
  description = "Redis node type"
}

variable "redis_parameter_group_name" {
  type        = string
  default     = "default.redis6.x"
  description = "Redis parameter group name. Should be aligned with the redis engine version"
}

variable "tags" {
  type = map(string)
  default = {
    "project" = "prebid-cache"
  }
  description = "A map of tags to add to all resources"
}
