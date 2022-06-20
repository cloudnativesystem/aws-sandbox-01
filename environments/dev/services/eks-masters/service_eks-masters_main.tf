#

resource "random_string" "suffix" {
  length  = 8
  special = false
}

module "eks" {
  source           = "../../modules/eks-masters"
  cluster_name     = local.cluster_name
  cluster_role_arn = module.eks_master_iam.cluster_role_arn
  cluster_version  = var.cluster_version
  private_subnets  = data.terraform_remote_state.vpc.outputs.private_subnets
  environment      = var.environment
  vpc_id           = data.terraform_remote_state.vpc.outputs.vpc_id

  tags = {
    Environment = var.environment
    Owner       = var.cluster_owner
  }

  node_k8s_labels = {
    Environment = var.environment
  }

  node_additional_tags = {

  }

  //dd_api_key              = data.aws_secretsmanager_secret_version.dd_api_key.secret_string
  //dd_api_key_arn          = data.aws_secretsmanager_secret_version.dd_api_key.arn
  //dd_app_key              = data.aws_secretsmanager_secret_version.dd_app_key.secret_string
  //external_secrets_region = var.region.Ohio
  //public_ingress_cert_arn = data.aws_acm_certificate.k8s_ingress_certificate.arn

}
