#########################
#         ALB           #
#########################

// APPLICATION LOAD BALANCER

resource "aws_security_group" "alb_sg" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.test_vpc.id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.public02.cidr_block]
  }

  tags = {
    Name = "ALB-SG"
  }
}

resource "aws_lb" "aws_alb" {
  name               = "aws-alb"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [aws_subnet.public01.id, aws_subnet.public02.id]
}



// ALB instance target group

resource "aws_lb_target_group" "test" {
  name     = "aws-3-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.test_vpc.id
}

// ALB TARGET GROUP ATTACHMENT

resource "aws_lb_target_group_attachment" "alb_tg_attc" {
  target_group_arn = aws_lb_target_group.test.arn
  target_id        = aws_instance.WEB_INSTANCE.id
  port             = 443
}

