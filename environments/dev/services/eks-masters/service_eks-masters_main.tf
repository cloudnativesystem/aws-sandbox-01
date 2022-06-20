locals {
  cluster_name = "${var.cluster_name}-${var.environment}-eks-${random_string.suffix.result}"
}

data "aws_caller_identity" "current" {}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
    token                  = data.aws_eks_cluster_auth.cluster.token
  }
}

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
