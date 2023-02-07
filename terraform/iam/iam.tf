data "aws_iam_policy" "ecsTaskExecutionRolePolicy" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

data "aws_iam_policy_document" "ecsExecutionRolePolicy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecsTaskExecutionRole" {
  name               = "ecsTaskExecutionRole-${var.config.projectName}-${var.config.environment}"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.ecsExecutionRolePolicy.json
}

resource "aws_iam_role_policy_attachment" "ecsTaskExecutionPolicy" {
  role       = aws_iam_role.ecsTaskExecutionRole.name
  policy_arn = data.aws_iam_policy.ecsTaskExecutionRolePolicy.arn
}



##############################################################################################

data "aws_iam_policy" "ecsInstanceRolePolicy" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

data "aws_iam_policy_document" "ecsInstanceRolePolicy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecsInstanceRole" {
  name               = "ecsInstanceRole-${var.config.projectName}-${var.config.environment}"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.ecsInstanceRolePolicy.json
}

resource "aws_iam_role_policy_attachment" "ecsInstancePolicy" {
  role       = aws_iam_role.ecsInstanceRole.name
  policy_arn = data.aws_iam_policy.ecsInstanceRolePolicy.arn
}

resource "aws_iam_instance_profile" "ecsInstanceRoleProfile" {
  name = aws_iam_role.ecsInstanceRole.name
  role = aws_iam_role.ecsInstanceRole.name
}



##############################################################################################

data "aws_iam_policy" "ecsServiceRolePolicy" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole"
}

data "aws_iam_policy_document" "ecsServiceRolePolicy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecsServiceRole" {
  name               = "ecsServiceRole-${var.config.projectName}-${var.config.environment}"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.ecsServiceRolePolicy.json
}

resource "aws_iam_role_policy_attachment" "ecsServicePolicy" {
  role       = aws_iam_role.ecsServiceRole.name
  policy_arn = data.aws_iam_policy.ecsServiceRolePolicy.arn
}


##############################################################################################

## Outputs
output "ecsTaskExecutionRoleArn" {
  value = aws_iam_role.ecsTaskExecutionRole.arn
}

output "ecsInstanceRoleName" {
  value = aws_iam_role.ecsInstanceRole.name
}

output "ecsServiceRoleArn" {
  value = aws_iam_role.ecsServiceRole.arn
}

output "ecsInstanceProfileName" {
  value = aws_iam_instance_profile.ecsInstanceRoleProfile.name
}
