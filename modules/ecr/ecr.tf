resource "aws_ecr_repository" "repository" {
  name                 = "${var.config.projectName}-${var.config.environment}-repo"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = var.tags
}

output "ecr_url" {
  value       = aws_ecr_repository.repository.repository_url
  description = "ECR repository url"
}
