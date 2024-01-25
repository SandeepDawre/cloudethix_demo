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


resource "aws_instance" "my_ec2_dev" {
  ami           = var.ami_id
  instance_type = var.dev_type
  count         = var.is_dev == "YES" ? 3 : 0
}

resource "aws_instance" "my_ec2_prod" {
  ami           = var.ami_id
  instance_type = var.prod_type
  count         = var.is_dev == "NO" ? 1 : 0
}
