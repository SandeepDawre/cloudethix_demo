variable "vpc_cidr_block" {
  type = string
}
variable "sg_name" {
  type = string
}
variable "sg_https_port" {
  type = number
}
variable "sg_http_port" {
  type = number
}
variable "sg_dns_port" {
  type    = number
  default = 53
}