resource "aws_security_group" "this_sg" {
  name        = var.sg_name
  description = var.description
  vpc_id      = "vpc-1bf43b66"
}

resource "aws_security_group_rule" "this_ingress" {
  count             = length(var.ingress_port)
  type              = "ingress"
  from_port         = var.ingress_port[count.index]
  to_port           = var.ingress_port[count.index]
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.this_sg.id
}

resource "aws_security_group_rule" "this_egress" {
  count             = length(var.egress_port)
  type              = "egress"
  from_port         = var.egress_port[count.index]
  to_port           = var.egress_port[count.index]
  protocol          = "tcp"
  security_group_id = aws_security_group.this_sg.id
  source_security_group_id = aws_security_group.this_sg.id
}