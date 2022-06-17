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

locals {
  cluster_name = "sandbox-${var.environment}-eks-${random_string.suffix.result}"
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}

/*data "terraform_remote_state" "dataplatform-iam" {
  backend = "s3"

  config = {
    bucket = "h1-data-platform-non-prod-tf-state"
    key    = "data-platform/dev_v1/iam/tf.state"
    region = "us-east-2"
  }
}*/

data "terraform_remote_state" "dev_vpc" {
  backend = "s3"

  config = {
    bucket = "onekloud-swagwatch-infra"
    key    = "onekloud-swagwatch-infra/dev/tf.state"
    region = "us-east-2"
  }
}


module "eks" {
  source       = "../../modules/eks-masters"
  cluster_name = local.cluster_name
  //cluster_role_arn        = data.terraform_remote_state.dataplatform-iam.outputs.cluster_role_arn
  cluster_role_arn = module.eks_master_iam.cluster_role_arn
  cluster_version  = "1.21"
  private_subnets  = data.terraform_remote_state.dev_vpc.outputs.private_subnets
  //dd_api_key              = data.aws_secretsmanager_secret_version.dd_api_key.secret_string
  //dd_api_key_arn          = data.aws_secretsmanager_secret_version.dd_api_key.arn
  //dd_app_key              = data.aws_secretsmanager_secret_version.dd_app_key.secret_string
  //external_secrets_region = var.region.Ohio
  environment = var.environment
  //public_ingress_cert_arn = data.aws_acm_certificate.k8s_ingress_certificate.arn

  tags = {
    Environment = var.environment
    Owner       = "data-platform"
  }

  vpc_id = data.terraform_remote_state.dev_vpc.outputs.vpc_id

  node_k8s_labels = {
    Environment = var.environment
  }

  node_additional_tags = {

  }

}