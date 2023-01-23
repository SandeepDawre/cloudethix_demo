variable "web_ssh_keyname" {
  type    = string
}
variable "web_ssh_public_key_path" {
  type    = string
}

variable "app_ssh_keyname" {
  type    = string
}
variable "app_ssh_public_key_path" {
  type    = string
}

// For Security Group
variable "main_vpc_id" {
  type    = string
}
variable "web_sg_name" {
  type    = string
}

variable "web_sg_port" {
  type    = list
}

variable "app_sg_name" {
  type    = string
}

variable "app_sg_port" {
  type    = list
}


// WEB & APP EC2 INSTANCE
variable "web_ami_id" {
  type    = string
}
variable "web_ec2_type" {
  type    = string
}
variable "app_ami_id" {
  type    = string
}
variable "app_ec2_type" {
  type    = string
}
