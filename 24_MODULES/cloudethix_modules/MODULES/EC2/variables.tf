variable "AAA_ami_id" {
  type = string
}

variable "AAA_instance_type" {
  type = string
}
variable "AAA_ssh_key_name" {
  type = string
}

variable "AAA_security_groups" {
  type = list(any)
}

