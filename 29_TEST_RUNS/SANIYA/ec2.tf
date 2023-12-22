#########################
#         EC2           #
#########################

// KEY PAIR

resource "aws_key_pair" "aws_3" {
  key_name   = "AWS_3"
  public_key = file("/root/.ssh/id_rsa.pub")
}

// WEB EC2 INSTANCE



resource "aws_security_group" "web_sg" {
  name        = "WEB-INSTANCE-SG"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.test_vpc.id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.public01.cidr_block, aws_subnet.public02.cidr_block]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.public01.cidr_block, aws_subnet.public02.cidr_block]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "WEB_INSTANCE" {
  ami                         = "ami-06d4b7182ac3480fa"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public01.id
  key_name                    = aws_key_pair.aws_3.key_name
  associate_public_ip_address = true
  security_groups             = ["${aws_security_group.web_sg.id}"]
  iam_instance_profile        = aws_iam_instance_profile.aws_iam_profile.name

  tags = {
    Name = "WEB_INSTANCE"
  }
}

// APP EC2 INSTANCE

resource "aws_security_group" "app_sg" {
  name        = "APPLICATION-INSTANCE-SG"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.test_vpc.id

  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.public02.cidr_block]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.private02.cidr_block]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.public01.cidr_block]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/18"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # egress {
  #   from_port   = 3306
  #   to_port     = 3306
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }
}

resource "aws_instance" "APP_INSTANCE" {
  ami                  = "ami-06d4b7182ac3480fa"
  instance_type        = "t2.micro"
  subnet_id            = aws_subnet.private01.id
  key_name             = aws_key_pair.aws_3.key_name
  security_groups      = [aws_security_group.app_sg.id]
  iam_instance_profile = aws_iam_instance_profile.aws_iam_profile.name

  tags = {
    Name = "APP_INSTANCE"
  }
}