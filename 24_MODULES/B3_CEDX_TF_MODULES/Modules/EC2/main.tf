resource "aws_instance" "this_ec2" {
  ami             = var.M_AMI_ID
  instance_type   = var.M_INSTANCE_TYPE
  key_name        = var.M_SSH_KEY_NAME
  security_groups = var.M_SECURITY_GROUP_NAMES

}