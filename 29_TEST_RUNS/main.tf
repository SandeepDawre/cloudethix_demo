resource "aws_instance" "this_ec2" {
  ami           = var.my_ami_id
  instance_type = var.my_instance_type
  tags = {
    Name = var.my_ec2_tag
  }
}

resource "aws_key_pair" "this_ssh_key" {
  key_name   = var.my_key_name
  public_key = var.my_public_key
}
