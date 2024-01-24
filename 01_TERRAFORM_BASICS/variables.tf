#THIS IS FOR EC2
variable "AMI_ID" {
  type = string
}
variable "INST_TYPE" {
  type = string
}
variable "EC2_TAG" {
  type = map
}

#THIS IS FOR SSH KEY
variable "SSH_KEY_NAME" {
  type = string
}
variable "SSH_PUB_KEY" {
  type = string
}


#THIS IS FOR SECURITY GROUP
variable "SG_NAME" {
  type = string
}
variable "HTTP_PORT" {
  type = number
}
variable "HTTPS_PORT" {
  type = number
}
variable "CIDR_RANGE" {
  type = string
}