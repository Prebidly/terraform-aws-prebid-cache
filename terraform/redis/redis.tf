resource "aws_elasticache_replication_group" "redis" {
  engine                     = "redis"
  engine_version             = var.engine_version
  replication_group_id       = "${var.config.projectName}-${var.config.environment}-cluster"
  description                = "${var.config.projectName}-${var.config.environment}-cluster"
  node_type                  = var.node_type
  num_cache_clusters         = 1
  parameter_group_name       = var.parameter_group_name
  port                       = 6379
  transit_encryption_enabled = false
  auto_minor_version_upgrade = false
  subnet_group_name          = aws_elasticache_subnet_group.subnet-group.name
  security_group_ids         = [var.sg_id]

  log_delivery_configuration {
    destination      = var.cloudwatch_log_group
    destination_type = "cloudwatch-logs"
    log_format       = "text"
    log_type         = "slow-log"
  }

  tags = var.tags
}


resource "aws_elasticache_subnet_group" "subnet-group" {
  name       = "${var.config.projectName}-${var.config.environment}-redis-subnet"
  subnet_ids = var.subnets
  tags       = var.tags
}
