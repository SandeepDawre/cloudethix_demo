module "web_ssh_key_pair" {
  source          = "./modules/SSH_KEY"
  keyname =  var.web_ssh_keyname
  public_key_path = var.web_ssh_public_key_path
 }

module "app_ssh_key_pair" {
  source          = "./modules/SSH_KEY"
  keyname =  var.app_ssh_keyname
  public_key_path = var.app_ssh_public_key_path

 }

#

module "web_security_group" {
  source          = "./modules/SECURITY_GROUP"
  sg_name         = var.web_sg_name
  vpc_id          = var.main_vpc_id
  sg_port         = var.web_sg_port
 }

 module "app_security_group" {
  source          = "./modules/SECURITY_GROUP"
  sg_name         = var.app_sg_name
  vpc_id          = var.main_vpc_id
  sg_port         = var.app_sg_port
 }

module "web_ec2" {
  source          = "./modules/EC2"
  ami_id = var.web_ami_id
  ec2_type = var.web_ec2_type
  Key_name = module.web_ssh_key_pair.SSH_KEY_NAME
  security_groups = [module.web_security_group.SECURITY_GROUP_NAME]

 }

 module "app_ec2" {
  source          = "./modules/EC2"
  ami_id = var.app_ami_id
  ec2_type = var.app_ec2_type
  Key_name = module.app_ssh_key_pair.SSH_KEY_NAME
  security_groups = [module.app_security_group.SECURITY_GROUP_NAME]
 }
