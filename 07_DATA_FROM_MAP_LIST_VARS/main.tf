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


resource "aws_instance" "my_ec2_from_list" {
  ami           = "ami-0b0dcb5067f052a63"
  instance_type = var.my_map["medium"]
}

resource "aws_instance" "my_ec2_from_map" {
  ami           = "ami-0b0dcb5067f052a63"
  instance_type = var.my_list["t2.small"]
}
