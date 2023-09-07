##FOR SSH KEY

variable "L_key_name" {
  type = string
}
variable "L_public_key_path" {
  type = string
}

##FOR EC2 INSTANCE
variable "L_ami_id" {
  type = string
}
variable "L_instance_type" {
  type = string
}

