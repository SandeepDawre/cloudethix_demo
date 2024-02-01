variable "M_AMI_ID" {
  type = string
}
variable "M_INSTANCE_TYPE" {
  type = string
}
variable "M_SSH_KEY_NAME" {
  type = string
}
variable "M_SECURITY_GROUP_NAMES" {
  type = list(any)
}