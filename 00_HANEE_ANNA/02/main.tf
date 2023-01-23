terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.46.0"
    }
  }
}

provider "aws" {
  region     = var.region
}

resource "aws_eip" "lb" {
  vpc      = var.is_true
}
