#########################
#         S3           #
#########################

// S3

resource "aws_s3_bucket" "aws_buc" {
  bucket = "saniya-abrar-s3-aws-bucket"
}

// CREATING IAM ROLE

resource "aws_iam_role" "s3_role" {
  name = "s3_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Effect" : "Allow",
        "Action" : [
          "sts:AssumeRole"
        ],
        "Principal" : {
          "Service" : [
            "ec2.amazonaws.com"
          ]
        }
      }
    ]
  })
}

// AWS IAM PROFILE

resource "aws_iam_instance_profile" "aws_iam_profile" {
  name = "iam_profile"
  role = aws_iam_role.s3_role.name
}

// IAM ROLE POLICY

resource "aws_iam_role_policy" "s3_policy" {
  name = "test_policy"
  role = aws_iam_role.s3_role.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:*",
        ],
        "Resource" : "*"
      }
    ]
  })
}