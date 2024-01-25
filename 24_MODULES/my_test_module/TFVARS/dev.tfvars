web_ssh_keyname         = "web_cloudethix-ssh-key"
web_ssh_public_key_path = "/root/.ssh/id_rsa.pub"

app_ssh_keyname         = "app_cloudethix-ssh-key"
app_ssh_public_key_path = "/root/.ssh/id_rsa.pub"


main_vpc_id = "vpc-1bf43b66"
web_sg_name = "web-sg"
web_sg_port = ["80", "443"]
app_sg_name = "aap-sg"
app_sg_port = ["8080"]

web_ami_id   = "ami-0b5eea76982371e91"
web_ec2_type = "t2.micro"
app_ami_id   = "ami-0b5eea76982371e91"
app_ec2_type = "t2.micro"
