variable "iam_user_names" {
  type    = list(any)
  default = ["dev", "stage", "prod"]
}


variable "iam_group_names" {
  type    = list(any)
  default = ["dev-group", "stage-group", "prod-group"]
}

variable "instance_types" {
  type    = list(any)
  default = ["t2.micro", "t2.medium", "t2.small"]
}