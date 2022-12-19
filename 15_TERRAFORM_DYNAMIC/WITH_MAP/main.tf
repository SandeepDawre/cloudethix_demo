terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.46.0"
    }
  }
}

provider  "aws" {
  region     = "us-east-1"
}


resource "aws_security_group" "dynamicsg" {
  name        = "dynamic-sg"
  description = "Ingress for Vault"
  vpc_id = "vpc-1bf43b66"

  dynamic "ingress" {
    for_each = var.aws_sg
    iterator = in_rule
    content {
    	  description = in_rule.value.description
      	from_port   = in_rule.value.port
      	to_port     = in_rule.value.port
      	protocol    = in_rule.value.protocol
      	cidr_blocks = in_rule.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.aws_sg
    iterator = out_rule
    content {
    	  description = out_rule.value.description
      	from_port   = out_rule.value.port
      	to_port     = out_rule.value.port
      	protocol    = out_rule.value.protocol
      	cidr_blocks = out_rule.value.cidr_blocks
    }
  }
}
