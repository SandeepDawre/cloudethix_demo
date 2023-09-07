resource "aws_key_pair" "this_login_key" {
  key_name   = var.M_key_name
  public_key = file(var.M_public_key_path)
}
