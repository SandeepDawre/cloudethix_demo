variable "cidr_block" {
  type = list(any)
}

variable "availability_zone" {
  type = list(any)
}

variable "destination_cidr_block" {
  type = string
}

variable "key_name" {
  type = string
}

variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "allocated_storage" {
  type = string
}

variable "engine" {
  type = string
}

variable "instance_class" {
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}

variable "skip_final_snapshot" {
  type = bool
}

variable "load_balancer_type" {
  type = string
}

variable "bucket" {
  type = string
}