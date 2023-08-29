//FOR WEB SERVER
module "web_ssh_key_pair" {
  source           = "./MODULES/SSH_KEY"
  AAA_ssh_key_name = var.XXX_web_ssh_key_name
  BBB_ssh_key_path = var.YYY_web_ssh_key_path
}

module "web_security_group" {
  source      = "./MODULES/SG"
  AAA_sg_name = var.XXX_web_sg_name
  BBB_vpc_id  = var.YYY_vpc_id
}


module "web_ec2_instance" {
  source              = "./MODULES/EC2"
  AAA_ami_id          = var.XXX_web_ami_id
  AAA_instance_type   = var.YYY_web_instance_type
  AAA_ssh_key_name    = module.web_ssh_key_pair.this_key_name
  AAA_security_groups = [module.web_security_group.this_sg_name]
}




//FOR APP SERVER

module "app_ssh_key_pair" {
  source           = "./MODULES/SSH_KEY"
  AAA_ssh_key_name = var.XXX_app_ssh_key_name
  BBB_ssh_key_path = var.YYY_app_ssh_key_path
}

module "app_security_group" {
  source      = "./MODULES/SG"
  AAA_sg_name = var.XXX_app_sg_name
  BBB_vpc_id  = var.YYY_vpc_id
}


module "app_ec2_instance" {
  source              = "./MODULES/EC2"
  AAA_ami_id          = var.XXX_app_ami_id
  AAA_instance_type   = var.YYY_app_instance_type
  AAA_ssh_key_name    = module.app_ssh_key_pair.this_key_name
  AAA_security_groups = [module.app_security_group.this_sg_name]
}