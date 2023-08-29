resource "aws_instance" "web" {
  ami             = var.AAA_ami_id
  instance_type   = var.AAA_instance_type
  key_name        = var.AAA_ssh_key_name
  security_groups = var.AAA_security_groups
}
