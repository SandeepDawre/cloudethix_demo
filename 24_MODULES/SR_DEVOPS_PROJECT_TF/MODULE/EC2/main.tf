resource "aws_instance" "this_ec2_instance" {
  ami           = var.M_ami_id
  instance_type = var.M_instance_type
  key_name      = var.M_ec2_key_name
}
