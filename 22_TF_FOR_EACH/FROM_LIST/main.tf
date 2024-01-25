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

/*
========================================
#FROM_LIST_EX_01
========================================
*/

locals {
  users = toset(["Todd", "James", "Alice", "Dottie"])
}

resource "aws_iam_user" "accounts" {
  for_each = local.users
  name     = each.key
}

output "users" {
  value = aws_iam_user.accounts
}

/*
========================================
#FROM_LIST_EX_02
# note: each.key and each.value are the same for a LIST
========================================
*/

locals {
  subnet_ids = toset([
    "subnet-abcdef",
    "subnet-012345",
  ])
}

resource "aws_instance" "server" {
  for_each = local.subnet_ids

  ami           = "ami-0b0dcb5067f052a63"
  instance_type = "t2.micro"
  subnet_id     = each.key

  tags = {
    Name = "Server ${each.key}"
  }
}
