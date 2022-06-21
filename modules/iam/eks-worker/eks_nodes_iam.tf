data "aws_partition" "current" {}

locals {
  policy_arn_prefix = "arn:${data.aws_partition.current.partition}:iam::aws:policy"
}

data "aws_iam_policy_document" "workers_assume_role_policy" {
  statement {
    sid = "EKSWorkerAssumeRole"

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "Service"
      identifiers = ["ec2.${data.aws_partition.current.dns_suffix}"]
    }
  }
}

resource "aws_iam_role" "workers" {
  name_prefix           = "${var.environment}-eks-node-iam-role"
  assume_role_policy    = data.aws_iam_policy_document.workers_assume_role_policy.json
  force_detach_policies = true
}

resource "aws_iam_role_policy_attachment" "workers_amazon_eks_worker_node_policy" {
  policy_arn = "${local.policy_arn_prefix}/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.workers.name
}

resource "aws_iam_role_policy_attachment" "workers_amazon_eks_cni_policy" {
  policy_arn = "${local.policy_arn_prefix}/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.workers.name
}

resource "aws_iam_role_policy_attachment" "workers_amazon_ec2_container_registry_readonly" {
  policy_arn = "${local.policy_arn_prefix}/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.workers.name
}
