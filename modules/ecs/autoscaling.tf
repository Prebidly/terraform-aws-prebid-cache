resource "aws_launch_configuration" "ecs_launch_config" {
  image_id             = data.aws_ami.amazon_linux_2.id
  iam_instance_profile = var.ecsInstanceProfileName
  security_groups      = var.securityGroupIds
  user_data            = "#!/bin/bash\necho ECS_CLUSTER=${local.clusterName} >> /etc/ecs/ecs.config"
  instance_type        = var.instance_type
}

resource "aws_autoscaling_group" "ecs_asg" {
  name                      = "${var.config.projectName}-${var.config.environment}-autoscaling-group"
  vpc_zone_identifier       = var.subnets
  launch_configuration      = aws_launch_configuration.ecs_launch_config.name
  desired_capacity          = 1
  min_size                  = 1
  max_size                  = 10
  health_check_grace_period = 300
  health_check_type         = "ELB"
  tag {
    key                 = "project"
    value               = var.config.projectName
    propagate_at_launch = true
  }
}
