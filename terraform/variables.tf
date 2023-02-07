variable "config" {
  type = object({
    environment = string
    region      = string
    projectName = string
  })
}

variable "vpc_id" {
  type = string
}

variable "subnets" {
  type = list(string)
}

variable "lb_target_group_arn" {
  type = string
}

variable "ec2_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "redis_engine_version" {
  type    = string
  default = "6.2"
}

variable "redis_node_type" {
  type    = string
  default = "cache.t2.small"
}

variable "redis_parameter_group_name" {
  type    = string
  default = "default.redis6.x"
}

variable "tags" {
  type = map(string)
  default = {
    "project" = "prebid-cache"
  }
}
