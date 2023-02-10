variable "config" {
  type = object({
    environment = string
    region      = string
    projectName = string
  })
  description = "Configuration object containing environment name, region name and the project name"
}

variable "ecsTaskExecutionRoleArn" {
  type        = string
  description = "ECS Task Execution Role ARN"
}

variable "ecsServiceRoleArn" {
  type        = string
  description = "ECS Service Role ARN"
}

variable "logGroupName" {
  type        = string
  description = "Cloudwatch log group name"
}

variable "task_container_image" {
  type        = string
  description = "ECR image URL of the prebid-cache the docker image"
}

variable "ecsInstanceProfileName" {
  type        = string
  description = "ECS Instance Profile Name"
}

variable "securityGroupIds" {
  type        = list(string)
  description = "List of security group ids"
}

variable "subnets" {
  type        = list(string)
  description = "List of subnet IDs associated with the VPC"
}

variable "vpc_id" {
  type        = string
  description = "Id of the VPC where resources should be deployed"
}

variable "lb_target_group_arn" {
  type        = string
  description = "ARN of the load balancer target group"
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type the prebid cache application will be running on"
}
