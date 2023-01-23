resource "aws_instance" "this_ec2"{
 ami           = var.ami_id
 instance_type = var.ec2_type
 key_name =   var.Key_name
 security_groups = var.security_groups
}
