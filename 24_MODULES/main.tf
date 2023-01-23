module "web_security_group" {
  source               = "./modules/02_SECURITY_GROUP"
  security_group_name  = var.web_security_group_name
  vpc_id               = module.vpc.vpc_id
  security_group_rules = var.web_security_group_rules
}


module "ssh_key_pair" {
  source          = "./modules/01_SSH_KEY"
  keyname         = var.keyname
  public_key_path = var.public_key_path

}

module "web_ec2_instance" {
  source                 = "./modules/03_EC2"
  ami_id                 = var.web_ami_id
  instance_type          = var.web_instance_type
  key_name               = module.ssh_key_pair.ssh_key_pair_key_name
  subnet_id              = module.vpc.private_subnet_ids[0]
  vpc_security_group_ids = [module.web_security_group.security_group_id]
  instance_name          = var.web_instance_name

}