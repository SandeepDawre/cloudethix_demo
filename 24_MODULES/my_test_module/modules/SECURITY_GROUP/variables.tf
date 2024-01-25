variable "sg_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "sg_port" {
  type = list(any)
}
