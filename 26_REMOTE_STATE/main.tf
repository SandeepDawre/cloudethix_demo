terraform {
  backend "s3" {
    //bucket = "cloudethix-terraform-state-bucket007"
    //key    = "esmail-g/pooja-mam/terraform.tfstate"
    //region = "us-east-1"
    skip_region_validation = true
    encrypt                = true
  }
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


resource "aws_instance" "this_ec2_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
}