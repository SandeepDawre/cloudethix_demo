terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.46.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.2.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "null" {
  # Configuration options
}

locals {
  strengths = {
    "Ironman"         = "Artificial Intelligence"
    "Captain America" = "Sheild"
    "Hulk"            = "Muscle Power"
    "Black widow"     = "Martial Arts"
    "Thor"            = "Hammer"
    "Spider Man"      = "Web"
    "Black Panther"   = "Vibranium suit"
  }
}
resource "null_resource" "strengths" {
  for_each = local.strengths
  triggers = {
    name  = each.key
    power = each.value
  }
}
output "strengths" {
  value = null_resource.strengths
}



resource "aws_instance" "dev" {
  for_each = {
    "vm1" = "t2-small"
    "vm2" = "t2-medium"
    "vm3" = "t2-micro"
  }
  ami           = "ami-082b5a644766e0e6f"
  instance_type = each.value
  tags = {
    Name = "Server ${each.key}"
  }
}




resource "aws_instance" "stage" {
  for_each = {
    "vm1" = { vm_size = "t2-small", zone = "us-east-1a" }
    "vm2" = { vm_size = "t2-medium", zone = "us-east-1b" }
    "vm3" = { vm_size = "t2-micro", zone = "us-east-1c" }
  }
  ami               = "ami-082b5a644766e0e6f"
  instance_type     = each.value.vm_size
  availability_zone = each.value.zone
  tags = {
    Name = "Server ${each.key}"
  }
}



locals {
  virtual_machines = {
    "vm1" = { vm_size = "t2-small", zone = "us-east-1a" },
    "vm2" = { vm_size = "t2-medium", zone = "us-east-1b" },
    "vm3" = { vm_size = "t2-micro", zone = "us-east-1c" }
  }
}

resource "aws_instance" "prod" {
  for_each          = local.virtual_machines
  ami               = "ami-082b5a644766e0e6f"
  instance_type     = each.value.vm_size
  availability_zone = each.value.zone
  tags = {
    Name = "Server ${each.key}"
  }
}
