resource "aws_iam_user" "lb" {
  name = "cloudethix.${count.index}"
  path = "/system/"
  count = 3
}
