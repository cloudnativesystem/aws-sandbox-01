variable "cluster_name" {
  type        = string
  description = "Name Of EKS Cluster"
}

variable "cluster_version" {
  type        = string
  description = "K8S version of this cluster"
}

variable "cluster_owner" {
  type        = string
  description = "Owner Of This Cluster"
}