module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
  private_subnet_cidr = var.private_subnet_cidr
  public_subnet_cidr = var.public_subnet_cidr
  env_prefix = var.env_prefix

  

}

module "Web_SecurityGroup" {
    source = "./modules/Web_SecurityGroup"
    vpc_id = module.vpc.vpc_id
    env_prefix = var.env_prefix
}

module "ec2" {
  source = "./modules/ec2"
  instance_type = var.instance_type
  sg_id = module.Web_SecurityGroup.sg_id
  subnets = module.vpc.subnet_ids
  key_name = var.key_name
  vpc_id = module.vpc.vpc_id
  ec2_names = [var.ec2_names[0]]
  env_prefix = var.env_prefix
}
