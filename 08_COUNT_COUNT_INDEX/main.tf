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


resource "aws_instance" "my_ec2" {
  ami           = "ami-0b0dcb5067f052a63"
  instance_type = "t2.micro"
  count = 3
}

resource "aws_iam_user" "lb" {
  name = "loadbalancer.${count.index}"
  path = "/system/"
  count = 3
}

resource "aws_iam_group" "developers" {
  name = var.iam_group_names[count.index]
  path = "/users/"
}