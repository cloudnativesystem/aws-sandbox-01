module "eks_master_iam" {
  source      = "../../modules/iam/eks-master"
  environment = var.environment
}