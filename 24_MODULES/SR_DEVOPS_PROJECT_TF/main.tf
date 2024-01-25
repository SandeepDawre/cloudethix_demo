module "SSH_KEY_PAIR" {
  source            = "./MODULE/SSH_KEY"
  M_key_name        = var.L_key_name
  M_public_key_path = var.L_public_key_path
}


module "EC2_INSTANCE" {
  source          = "./MODULE/EC2"
  M_ami_id        = var.L_ami_id
  M_instance_type = var.L_instance_type
  M_ec2_key_name  = module.SSH_KEY_PAIR.SSH_KEY_NAME
}
