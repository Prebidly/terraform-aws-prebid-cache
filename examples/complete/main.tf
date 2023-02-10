terraform {
  required_version = ">= 1.3.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0"
    }
  }
}

provider "aws" {
  region  = var.config.region
}

module "prebid-cache" {
#  source = "prebidly/prebid-cache-infra/aws"
  source = "git::https://github.com/Prebidly/prebid-cache-infra.git"

  config              = var.config
  lb_target_group_arn = var.lb_target_group_arn
  subnets             = var.subnets
  vpc_id              = var.vpc_id
}
