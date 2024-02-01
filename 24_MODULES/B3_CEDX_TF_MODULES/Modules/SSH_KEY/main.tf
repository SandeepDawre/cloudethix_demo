resource "aws_key_pair" "THIS_SSH_KEY" {
  key_name   = var.M_SSH_KEY_NAME
  public_key = var.M_SSH_KEY_PAIR
}
