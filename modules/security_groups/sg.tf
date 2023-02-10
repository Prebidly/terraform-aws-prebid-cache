module "sgRedis" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.13.1"

  name   = "${var.config.projectName}-${var.config.environment}-redis-security-group"
  vpc_id = var.vpc_id
  tags   = var.tags

  ingress_with_cidr_blocks = [
    {
      protocol    = "tcp"
      from_port   = 6379
      to_port     = 6379
      cidr_blocks = "0.0.0.0/0"
      description = "Allow incoming traffic on port 6379"
    },
  ]


  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 65535
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
      description = "Allow outgoing traffic on all ports"
    },
  ]
}


module "sgECS" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.13.1"

  name   = "${var.config.projectName}-${var.config.environment}-ecs-security-group"
  vpc_id = var.vpc_id
  tags   = var.tags

  ingress_with_cidr_blocks = [
    {
      protocol         = "tcp"
      from_port        = 2424
      to_port          = 2424
      cidr_blocks      = "0.0.0.0/0"
      ipv6_cidr_blocks = "::/0"
      description      = "Allow incoming traffic on the ecs container port of 2424"
    },
    {
      protocol         = "tcp"
      from_port        = 2525
      to_port          = 2525
      cidr_blocks      = "0.0.0.0/0"
      ipv6_cidr_blocks = "::/0"
      description      = "Allow incoming traffic on the ecs container port of 2525"
    },
    {
      protocol    = "tcp"
      from_port   = 80
      to_port     = 80
      cidr_blocks = "0.0.0.0/0"
      description = "Allow incoming ssh traffic on port 80"
    },
  ]


  egress_with_cidr_blocks = [
    {
      from_port        = 0
      to_port          = 65535
      protocol         = "tcp"
      cidr_blocks      = "0.0.0.0/0"
      ipv6_cidr_blocks = "::/0"
      description      = "Allow outgoing traffic on all ports"
    },
  ]
}

output "redis_security_group_id" {
  value = module.sgRedis.security_group_id
}

output "ecs_security_group_id" {
  value = module.sgECS.security_group_id
}
