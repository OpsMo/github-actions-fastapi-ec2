resource "aws_instance" "fastapi_staging" {
  ami                  = var.ec2_ami
  instance_type        = var.instance_type
  key_name             = var.key_name
  iam_instance_profile = aws_iam_instance_profile.ec2_ecr_access.name

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install docker -y
              service docker start
              usermod -a -G docker ec2-user
              docker run -d -p 8000:8000 ${aws_ecr_repository.fastapi-ecr.repository_url}:latest
              EOF

  tags = {
    Name = "fastapi-staging-env"
  }
}

resource "aws_instance" "fastapi_prod" {
  ami                  = var.ec2_ami
  instance_type        = var.instance_type
  key_name             = var.key_name
  iam_instance_profile = aws_iam_instance_profile.ec2_ecr_access.name

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install docker -y
              service docker start
              usermod -a -G docker ec2-user
              docker run -d -p 8000:8000 ${aws_ecr_repository.fastapi-ecr.repository_url}:latest
              EOF

  tags = {
    Name = "fastapi-prod-env"
  }

}
