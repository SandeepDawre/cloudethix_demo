variable "sg_name" {
  type = string
}
variable "description" {
  type = string
}
variable "ingress_port" {
  type = list(any)
}
variable "egress_port" {
  type = list(any)
}