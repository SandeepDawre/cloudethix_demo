variable "usernumber" {
  type = number
  default = "100"
}

variable "elb_name" {
  type = string
}

variable "az" {
  type = list
}

variable "timeout" {
  type = number
}
