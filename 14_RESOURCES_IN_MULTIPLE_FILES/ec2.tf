resource "aws_instance" "my_ec2" {
  ami           = "ami-0b0dcb5067f052a63"
  instance_type = "t2.micro"
  count         = 3
}
