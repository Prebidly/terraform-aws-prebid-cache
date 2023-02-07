variable "config" {
  type = object({
    environment = string
    region      = string
    projectName = string
  })
}

variable "ecsTaskExecutionRoleArn" {
  type = string
}

variable "ecsServiceRoleArn" {
  type = string
}

variable "logGroupName" {
  type = string
}

variable "task_container_image" {
  type = string
}

variable "ecsInstanceProfileName" {
  type = string
}

variable "securityGroupIds" {
  type = list(string)
}

variable "subnets" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "lb_target_group_arn" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "instance_type" {
  type = string
}
