data "aws_vpc" "default" {
    default = true
  
}
resource "aws_security_group" "fastapi_ssh_access" {
  name        = "fastapi-ssh-access"
  description = "Allow SSH access -port 22"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_instance" "fastapi_staging" {
  ami                  = var.ec2_ami
  instance_type        = var.instance_type
  key_name             = var.key_name
  iam_instance_profile = aws_iam_instance_profile.ec2_ecr_access.name
  vpc_security_group_ids = [aws_security_group.fastapi_ssh_access.id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install docker -y
              systemctl start docker
              systemctl enable docker
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
  vpc_security_group_ids = [aws_security_group.fastapi_ssh_access.id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install docker -y
              systemctl start docker
              systemctl enable docker
              usermod -a -G docker ec2-user
              docker run -d -p 8000:8000 ${aws_ecr_repository.fastapi-ecr.repository_url}:latest
              EOF

  tags = {
    Name = "fastapi-prod-env"
  }

}