terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.46.0"
    }
  }
}

provider "aws" {
  
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-0b0dcb5067f052a63"
  instance_type = "t2.micro"
}