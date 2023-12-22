
#########################
#         RDS           #
#########################

// SUBNET GROUP

resource "aws_db_subnet_group" "db_sg" {
  name       = "aws-sg"
  subnet_ids = [aws_subnet.private01.id, aws_subnet.private02.id]
  //vpc_id     = aws_vpc.test_vpc.id


  tags = {
    Name = "aws-sg"
  }
}


// RDS

resource "aws_security_group" "rds_sg" {
  name        = "RDS-SECURITY-GROUP"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.test_vpc.id

  ingress {
    description = "TLS from VPC"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.private01.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "RDS_SG"
  }
}

resource "aws_db_instance" "aws_rds" {
  allocated_storage      = 10
  db_name                = "mydb"
  engine                 = "mysql"
  db_subnet_group_name   = aws_db_subnet_group.db_sg.id
  instance_class         = "db.t2.micro"
  username               = "admin"
  password               = "root1234"
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

}
