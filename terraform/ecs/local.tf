locals {
  containerName  = "${var.config.projectName}-${var.config.environment}-container"
  clusterName    = "${var.config.projectName}-${var.config.environment}-cluster"
  containerPort1 = 2424
  containerPort2 = 2525
}
