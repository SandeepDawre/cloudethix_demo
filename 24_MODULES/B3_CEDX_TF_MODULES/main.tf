module "MY_SSH_KEY" {
  source         = "./Modules/SSH_KEY"
  M_SSH_KEY_NAME = var.P_SSH_KEY_NAME
  M_SSH_KEY_PAIR = file(var.P_SSH_KEY_PAIR)
}
module "MY_SEC_SG" {
  source       = "./Modules/SECURITY_GROUP"
  M_SG_NAME    = var.P_SG_NAME
  M_HTTP_PORT  = var.P_HTTP_PORT
  M_CIDR_RANGE = var.P_CIDR_RANGE
}
module "MY_EC2_ISNATNCE" {
  source                 = "./Modules/EC2"
  M_AMI_ID               = var.P_AMI_ID
  M_INSTANCE_TYPE        = var.P_INSTANCE_TYPE
  M_SSH_KEY_NAME         = module.MY_SSH_KEY.KEY_NAME
  M_SECURITY_GROUP_NAMES = [module.MY_SEC_SG.THIS_SG_NAME]
}



### THIS FOR WEB SERVER 
module "WEB_SSH_KEY" {
    source = "./Modules/SSH_KEY"
    M_SSH_KEY_NAME = var.P_WEB_SSH_KEY_NAME 
    M_SSH_KEY_PAIR = file(var.P_WEB_SSH_KEY_PAIR)
}
module "WEB_SEC_SG" {
  source       = "./Modules/SECURITY_GROUP"
  M_SG_NAME    = var.P_WEB_SG_NAME
  M_HTTP_PORT  = var.P_WEB_HTTP_PORT
  M_CIDR_RANGE = var.P_WEB_CIDR_RANGE
}
module "WEB_EC2_ISNATNCE" {
  source                 = "./Modules/EC2"
  M_AMI_ID               = var.P_WEB_AMI_ID
  M_INSTANCE_TYPE        = var.P_WEB_INSTANCE_TYPE
  M_SSH_KEY_NAME         = module.WEB_SSH_KEY.KEY_NAME
  M_SECURITY_GROUP_NAMES = [module.WEB_SEC_SG.THIS_SG_NAME]
}


### THIS FOR APP SERVER 
module "APP_SSH_KEY" {
    source = "./Modules/SSH_KEY"
    M_SSH_KEY_NAME = var.P_APP_SSH_KEY_NAME 
    M_SSH_KEY_PAIR = file(var.P_APP_SSH_KEY_PAIR)
}
module "APP_SEC_SG" {
  source       = "./Modules/SECURITY_GROUP"
  M_SG_NAME    = var.P_APP_SG_NAME
  M_HTTP_PORT  = var.P_APP_HTTP_PORT
  M_CIDR_RANGE = var.P_APP_CIDR_RANGE
}
module "APP_EC2_ISNATNCE" {
  source                 = "./Modules/EC2"
  M_AMI_ID               = var.P_APP_AMI_ID
  M_INSTANCE_TYPE        = var.P_APP_INSTANCE_TYPE
  M_SSH_KEY_NAME         = module.APP_SSH_KEY.KEY_NAME
  M_SECURITY_GROUP_NAMES = [module.APP_SEC_SG.THIS_SG_NAME]
}