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


resource "aws_iam_user" "lb" {
  name = "iamuser.${count.index}"
  count = 3
  path = "/system/"
}

output "arns1" {
  value = aws_iam_user.lb[0].arn
}
output "arns2" {
  value = aws_iam_user.lb[1].arn
}
output "arns3" {
  value = aws_iam_user.lb[2].arn
}
output "arns_all" {
  value = aws_iam_user.lb[*].arn
}