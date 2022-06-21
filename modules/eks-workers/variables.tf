variable "cluster_name" {
  type        = string
  description = "EKS Cluster Name"
}

variable "node_role_arn" {
  type        = string
  description = "IAM Role For This Node Group"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs for This Node Group"
}

variable "node_group_settings" {
  type = object({
      name           = string
      desired_size   = number
      max_size       = number
      min_size       = number
      instance_types = list(string)
      capacity_type  = string
      disk_size      = number
      labels         = map(string)
      has_taint      = bool
      taint_key      = string
      taint_value    = string
      taint_effect   = string
      tags           = map(string)
  })
}