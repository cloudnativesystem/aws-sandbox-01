module "eks_worker_iam" {
  source      = "../../modules/iam/eks-worker"
  environment = var.environment
}

