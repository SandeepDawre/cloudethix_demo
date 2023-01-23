// SSH_KEY
variable "keyname" {
  type = string
}
variable "public_key_path" {
  type = string
}


//FOR WEB EC2 INSTANCE
variable "web_ami_id" {
  type = string
}

variable "web_instance_type" {
  type = string
}

variable "web_instance_name" {
  type = string
}

//FOR SECURITY GROUP

variable "sg_name" {
  type = string
}
variable "description" {
  type = string
}
variable "ingress_port" {
  type = list
}
variable "egress_port" {
  type = list
}