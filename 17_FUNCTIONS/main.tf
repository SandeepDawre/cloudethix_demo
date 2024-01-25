
# We are running Null Provisioner.

// This is second type of comment.

/*
https://developer.hashicorp.com/terraform/language
Line 1
Line 2
Line 3
*/

/*
Numeric Functions
String Functions
Collection Functions
Encoding Functions
Filesystem Functions
Date and Time Functions
Hash and Crypto Functions
IP Network Functions
Type Conversion Functions
*/


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

locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

variable "region" {
  default = "us-east-1"
}

variable "tags" {
  type    = list(any)
  default = ["ce-first-EC2", "ce-second-EC2"]
}

variable "ami" {
  type = map(any)
  default = {
    "us-east-1"  = "ami-082b5a644766e0e6f"
    "us-west-2"  = "ami-0d6621c01e8c2de2c"
    "ap-south-1" = "ami-0470e33cd681b2476"
  }
}

resource "aws_key_pair" "loginkey" {
  key_name   = "login-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "app-dev" {
  ami           = lookup(var.ami, var.region)
  instance_type = "t2.micro"
  key_name      = aws_key_pair.loginkey.key_name
  count         = 2

  tags = {
    Name = element(var.tags, count.index)
  }
}

output "timestamp" {
  value = local.time
}
