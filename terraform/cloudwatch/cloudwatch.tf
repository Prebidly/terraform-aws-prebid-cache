locals {
  logGroupName = "${var.config.projectName}-${var.config.environment}-logs"
}

resource "aws_cloudwatch_log_group" "ecsTaskLogger" {
  name = local.logGroupName

  retention_in_days = 14

  tags = var.tags
}

## Outputs
output "logGroupName" {
  value = local.logGroupName
}
