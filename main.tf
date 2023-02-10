module "cloudwatch" {
  source = "./modules/cloudwatch"

  config = var.config
  tags   = var.tags
}

module "iam" {
  source = "./modules/iam"

  config = var.config
}

module "security_groups" {
  source = "./modules/security_groups"

  config = var.config
  vpc_id = var.vpc_id
  tags   = var.tags
}

module "ecr" {
  source = "./modules/ecr"

  config = var.config
  tags   = var.tags
}

module "ecs" {
  source = "./modules/ecs"

  config                  = var.config
  ecsServiceRoleArn       = module.iam.ecsServiceRoleArn
  ecsTaskExecutionRoleArn = module.iam.ecsTaskExecutionRoleArn
  logGroupName            = module.cloudwatch.logGroupName
  task_container_image    = module.ecr.ecr_url
  ecsInstanceProfileName  = module.iam.ecsInstanceProfileName
  securityGroupIds        = [module.security_groups.ecs_security_group_id]
  subnets                 = var.subnets
  vpc_id                  = var.vpc_id
  lb_target_group_arn     = var.lb_target_group_arn
  tags                    = var.tags
  instance_type           = var.ec2_instance_type
}


module "redis" {
  source = "./modules/redis"

  config               = var.config
  engine_version       = var.redis_engine_version
  node_type            = var.redis_node_type
  parameter_group_name = var.redis_parameter_group_name
  subnets              = var.subnets
  cloudwatch_log_group = module.cloudwatch.logGroupName
  sg_id                = module.security_groups.redis_security_group_id
  tags                 = var.tags
}
