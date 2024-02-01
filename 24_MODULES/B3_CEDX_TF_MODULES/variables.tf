#THIS IS FOR SSH _KEY
variable "P_SSH_KEY_NAME" {
  type = string
}
variable "P_SSH_KEY_PAIR" {
  type = string
}

#THIS IS FOR EC2 Instance
variable "P_AMI_ID" {
  type = string
}
variable "P_INSTANCE_TYPE" {
  type = string
}


#THIS IS FOR SEC SG
variable "P_SG_NAME" {
  type = string
}
variable "P_HTTP_PORT" {
  type = string
}
variable "P_CIDR_RANGE" {
  type = list(any)
}


### THIS IS FOR WEB SERVER 
variable "P_WEB_SSH_KEY_NAME" {
  type = string
}
variable "P_WEB_SSH_KEY_PAIR" {
  type = string
}
variable "P_WEB_SG_NAME" {
  type = string
}
variable "P_WEB_HTTP_PORT" {
  type = string
}
variable "P_WEB_CIDR_RANGE" {
  type = list(any)
}
variable "P_WEB_AMI_ID" {
  type = string
}
variable "P_WEB_INSTANCE_TYPE" {
  type = string
}



### THIS IS FOR AP SERVER 
variable "P_APP_SSH_KEY_NAME" {
  type = string
}
variable "P_APP_SSH_KEY_PAIR" {
  type = string
}
variable "P_APP_SG_NAME" {
  type = string
}
variable "P_APP_HTTP_PORT" {
  type = string
}
variable "P_APP_CIDR_RANGE" {
  type = list(any)
}
variable "P_APP_AMI_ID" {
  type = string
}
variable "P_APP_INSTANCE_TYPE" {
  type = string
}