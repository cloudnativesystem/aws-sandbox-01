output "cluster_id" {
  description = "The name/id of the EKS cluster. Will block on cluster creation until the cluster is really ready"
  value       = element(concat(aws_eks_cluster.this.*.id, [""]), 0)
  # So that calling plans wait for the cluster to be available before attempting
  # to use it. They will not need to duplicate this null_resource
  depends_on = [data.http.wait_for_cluster]
}

output "cluster_arn" {
  description = "The Amazon Resource Name (ARN) of the cluster."
  value       = element(concat(aws_eks_cluster.this.*.arn, [""]), 0)
}

output "cluster_endpoint" {
  description = "The endpoint for your EKS Kubernetes API."
  value       = element(concat(aws_eks_cluster.this.*.endpoint, [""]), 0)
}

output "cluster_version" {
  description = "The Kubernetes server version for the EKS cluster."
  value       = element(concat(aws_eks_cluster.this[*].version, [""]), 0)
}

output "cluster_ca_certificate" {
  description = "The CA Certficate used to sign the cluster certs"
  value       = base64decode(aws_eks_cluster.this.certificate_authority[0].data)
}

output "oidc_issuer_url" {
  value = aws_eks_cluster.this.identity[0].oidc.0.issuer
}

output "oidc_provider_arn" {
  description = "The ARN of the OIDC Provider if `enable_irsa = true`."
  value       = aws_iam_openid_connect_provider.oidc_provider.arn
}