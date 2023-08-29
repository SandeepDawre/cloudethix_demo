resource "aws_security_group" "var_demo" {
  name        = var.sg_name

  ingress {
    from_port   = var.sg_https_port
    to_port     = var.sg_https_port
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr_block]
  }

  ingress {
    from_port   = var.sg_http_port
    to_port     = var.sg_http_port
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr_block]
  }

  ingress {
    from_port   = var.sg_dns_port
    to_port     = var.sg_dns_port
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr_block]
  }
}
