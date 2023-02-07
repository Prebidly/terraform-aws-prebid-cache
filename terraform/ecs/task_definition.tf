resource "aws_ecs_task_definition" "taskDefinition" {
  family                   = "${var.config.projectName}-${var.config.environment}-task"
  execution_role_arn       = var.ecsTaskExecutionRoleArn
  requires_compatibilities = ["EC2"]
  network_mode             = "bridge"

  container_definitions = jsonencode([
    {
      "name"      = local.containerName
      "image"     = var.task_container_image
      "essential" = true
      "memoryReservation" : 300

      "logConfiguration" : {
        "logDriver" : "awslogs",
        "options" : {
          "awslogs-group" : var.logGroupName,
          "awslogs-stream-prefix" : "node",
          "awslogs-region" : var.config.region
        }
      }

      "portMappings" = [
        {
          "hostPort" : local.containerPort1,
          "protocol" : "tcp",
          "containerPort" = local.containerPort1
        },
        {
          "hostPort" : local.containerPort2,
          "protocol" : "tcp",
          "containerPort" = local.containerPort2
        }
      ]
    }
  ])
}


## outputs
output "containerName" {
  value = local.containerName
}

output "taskDefinitionArn" {
  value = aws_ecs_task_definition.taskDefinition.arn
}
