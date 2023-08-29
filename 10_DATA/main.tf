terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.46.0"
    }
  }
}


provider "aws" {
  region = var.region
}


data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name = "name"


    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"]
}


output "test" {
  value = data.aws_ami.ubuntu
}


resource "aws_instance" "my_ubuntu" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.type
}
