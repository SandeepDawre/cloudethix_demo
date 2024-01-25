terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.46.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

#THIS IS FOR SSH KEY
resource "aws_key_pair" "this_ssh_key" {
  key_name   = var.SSH_KEY_NAME
  public_key = var.SSH_PUB_KEY
}

#THIS IS FOR EC2
resource "aws_instance" "this_ec2" {
  ami           = var.AMI_ID
  instance_type = var.INST_TYPE
  tags          = var.EC2_TAG
}


#THIS IS FOR SG
resource "aws_security_group" "this_sg" {
  name = var.SG_NAME

  ingress {
    from_port   = var.HTTP_PORT
    to_port     = var.HTTP_PORT
    protocol    = "tcp"
    cidr_blocks = [var.CIDR_RANGE]
  }

  ingress {
    from_port   = var.HTTPS_PORT
    to_port     = var.HTTPS_PORT
    protocol    = "tcp"
    cidr_blocks = [var.CIDR_RANGE]
  }

}