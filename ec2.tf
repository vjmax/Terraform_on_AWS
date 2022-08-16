# Terraform Settings Block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      #version = "~> 3.21" # Optional but recommended in production
    }
  }
}

# Provider Block
provider "aws" {
  #profile = "default" # AWS Credentials Profile configured on your local desktop terminal  $HOME/.aws/credentials
  region  = "ap-south-1"
}

resource "aws_security_group" "web-ssg" {
  name = "allow_all"
  ingress {
    from_port   = 0
    to_port     = 65534
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

# Resource Block
resource "aws_instance" "ec2demo" {
  ami           = "ami-07eaf27c7c4a884cf" # Ubuntu 18.04 in ap-south-1.
  instance_type = "t2.micro"
  key_name      = "newvj"
  vpc_security_group_ids = [aws_security_group.web-sg.id]
  count = 2
}

