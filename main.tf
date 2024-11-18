# project-root/main.tf

provider "aws" {
  region = var.aws_region
}

# Call the network module
module "network" {
  source            = "./modules/network"
  vpc_cidr          = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones = var.availability_zones
}

# Call the compute module
module "compute" {
  source          = "./modules/compute"
  vpc_id          = module.network.vpc_id
  public_subnets  = module.network.public_subnets
  private_subnets = module.network.private_subnets
  instance_type   = var.instance_type
  ami_id          = var.ami_id
  security_group_id = module.network.security_group_id
}
