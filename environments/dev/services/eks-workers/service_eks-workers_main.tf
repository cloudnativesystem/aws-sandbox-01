module "primary" {
  source = "../../modules/eks-workers"

  cluster_name        = data.terraform_remote_state.remote_state.outputs.cluster_id
  node_role_arn       = module.eks_worker_iam.worker_node_arn
  subnet_ids          = data.terraform_remote_state.remote_state.outputs.private_subnets
  node_group_settings = var.primary_node_group_settings
}