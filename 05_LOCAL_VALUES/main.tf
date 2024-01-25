terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.46.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


locals {
  common_tags = {
    Owner   = "DevOps Team"
    service = "backend"
  }
}

resource "aws_instance" "app-dev" {
  ami           = "ami-082b5a644766e0e6f"
  instance_type = "t2.micro"
  tags          = local.common_tags
}

resource "aws_ebs_volume" "my_ebs" {
  availability_zone = "us-west-2a"
  size              = 8
  tags              = local.common_tags
}
