terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.46.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
}


resource "aws_instance" "my_ec2_dev" {
  ami           = var.ami_id
  instance_type = var.dev_type
  count = var.istest == true ? 3 : 0
}

resource "aws_instance" "my_ec2_prod" {
  ami           = var.ami_id
  instance_type = var.dev_type
  count = var.istest == false ? 1 : 0
}
