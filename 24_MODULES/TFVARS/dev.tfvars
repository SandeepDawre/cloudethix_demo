//FOR SSH KEY
keyname = "cloudethix-ssh-key"
public_key_path = "/root/.ssh/id_rsa.pub"

//FOR WEB EC2
web_ami_id        = "ami-0b0dcb5067f052a63"
web_instance_type = "t2.micro"
web_instance_name = "web_server"

//FOR WEB SG
sg_name = "web-server-sg"
description = "This is web server Security Group"
ingress_port = ["80" , "443"]
egress_port = ["80" , "443"]