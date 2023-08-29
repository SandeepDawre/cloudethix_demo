resource "aws_key_pair" "this_ssh_key" {
  key_name   = var.AAA_ssh_key_name
  public_key = file(var.BBB_ssh_key_path)
}