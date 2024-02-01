resource "aws_security_group" "this_sg" {
  name = var.M_SG_NAME

  ingress {
    from_port   = var.M_HTTP_PORT
    to_port     = var.M_HTTP_PORT
    protocol    = "tcp"
    cidr_blocks = var.M_CIDR_RANGE
  }

  ingress {
    from_port   = var.M_HTTP_PORT
    to_port     = var.M_HTTP_PORT
    protocol    = "tcp"
    cidr_blocks = var.M_CIDR_RANGE
  }

}