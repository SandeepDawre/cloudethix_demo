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

resource "aws_eip" "lb" {
  vpc = true
}

output "eip" {
  value = aws_eip.lb.public_ip
}


resource "aws_s3_bucket" "mys3" {
  bucket = "cloudethix-terraform-bucket-2121304"
}

output "mys3bucket" {
  value = aws_s3_bucket.mys3.id
}
