variable "my_list" {
  type    = list(any)
  default = ["t2.micro", "t2.small", "t2.medium", "t2.large"]
}


variable "my_map" {
  type = map(any)
  default = {
    micro  = "t2.micro"
    small  = "t2.small"
    medium = "t2.medium"
    large  = "t2.large"
  }
}

