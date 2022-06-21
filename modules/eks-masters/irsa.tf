locals {
  sts_principal = "sts.${data.aws_partition.current.dns_suffix}"
}

resource "aws_iam_openid_connect_provider" "oidc_provider" {
  client_id_list  = [local.sts_principal]
  thumbprint_list = [var.eks_oidc_root_ca_thumbprint]
  url             = aws_eks_cluster.this.identity[0].oidc.0.issuer

  tags = merge(
    {
      Name = "${var.cluster_name}-eks-irsa"
    },
    var.tags
  )
}