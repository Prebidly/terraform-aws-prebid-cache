resource "aws_ecs_cluster" "cluster" {
  name = local.clusterName

  setting {
    name  = "containerInsights"
    value = "disabled"
  }

  tags = var.tags
}

resource "aws_ecs_service" "ecsService" {
  name                               = "${var.config.projectName}-${var.config.environment}-service"
  cluster                            = aws_ecs_cluster.cluster.id
  launch_type                        = "EC2"
  task_definition                    = aws_ecs_task_definition.taskDefinition.arn
  desired_count                      = 1
  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200
  enable_ecs_managed_tags            = true

  ordered_placement_strategy {
    type  = "spread"
    field = "attribute:ecs.availability-zone"
  }

  ordered_placement_strategy {
    type  = "spread"
    field = "instanceId"
  }

  load_balancer {
    target_group_arn = var.lb_target_group_arn
    container_name   = local.containerName
    container_port   = local.containerPort1
  }

  tags = var.tags
}
