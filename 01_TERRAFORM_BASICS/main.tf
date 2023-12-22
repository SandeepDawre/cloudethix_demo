terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.46.0"
    }
  }
}

provider "aws" {
    # Configuration options
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-05c13eab67c5d8861"
  instance_type = "t2.micro"
  tags = {
    Name = "HelloWorld"
  }
}