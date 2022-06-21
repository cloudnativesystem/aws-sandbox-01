resource "aws_cloudwatch_log_group" "this" {
  name              = "/aws/eks/${var.cluster_name}/cluster"
  retention_in_days = var.cluster_log_retention_in_days
  tags              = var.tags
}


resource "aws_security_group" "cluster" {
  name_prefix = var.cluster_name
  description = "EKS cluster security group."
  vpc_id      = var.vpc_id
  tags = merge(
    var.tags,
    {
      "Name" = "${var.cluster_name}-eks_cluster_sg"
    },
  )
}


resource "aws_eks_cluster" "this" {
  name                      = var.cluster_name
  enabled_cluster_log_types = ["api", "audit", "scheduler"]
  role_arn                  = var.cluster_role_arn
  version                   = var.cluster_version
  tags                      = var.tags

  vpc_config {
    security_group_ids      = compact([aws_security_group.cluster.id])
    subnet_ids              = var.private_subnets
    endpoint_private_access = false
    endpoint_public_access  = true
  }

  depends_on = [
    aws_cloudwatch_log_group.this
  ]
}

data "http" "wait_for_cluster" {
  url            = format("%s/healthz", aws_eks_cluster.this.endpoint)
  ca_certificate = base64decode(aws_eks_cluster.this.certificate_authority[0].data)
  timeout        = 300
  depends_on = [
    aws_eks_cluster.this
  ]
}


data "aws_partition" "current" {}

locals {
  policy_arn_prefix = "arn:${data.aws_partition.current.partition}:iam::aws:policy"
}