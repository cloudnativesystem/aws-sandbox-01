# vpc_main.tf
module "vpc" {

  source = "../../modules/vpc"
  name   = var.vpc_name
  cidr   = var.vpc_cidr

  environment = var.environment
  vpc_name    = var.vpc_name

  azs             = var.vpc_azs
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  enable_s3_endpoint = var.enable_s3_endpoint

  tags = var.common_tags

  vpc_tags = var.vpc_tags
}