variable "elb_name" {
  type = string
}

variable "az" {
  type = list(any)
}

variable "timeout" {
  type = number
}
