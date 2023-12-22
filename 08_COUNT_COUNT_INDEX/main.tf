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

resource "aws_instance" "my_ec2" {
  count         = length(var.instance_types)
  ami           = "ami-0b0dcb5067f052a63"
  instance_type = var.instance_types["${count.index}"]
}

resource "aws_iam_user" "lb" {
  count = length(var.iam_user_names)
  name  = var.iam_user_names["${count.index}"]
  path  = "/system/"

}


resource "aws_iam_group" "developers" {
  count = length(var.iam_group_names)
  name  = var.iam_group_names["${count.index}"]
  path  = "/users/"
}
