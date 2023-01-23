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

resource "aws_instance" "my_vm" {
 ami           = var.ami
 instance_type = var.instance_type
 
 tags = {
   Name = var.name_tag
 }
}
