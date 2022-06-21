
resource "aws_eks_node_group" "this" {
  node_group_name = "${var.cluster_name}-${var.node_group_settings.name}"
  cluster_name    = var.cluster_name
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = var.node_group_settings.desired_size
    max_size     = var.node_group_settings.max_size
    min_size     = var.node_group_settings.min_size
  }

  instance_types = var.node_group_settings.instance_types
  capacity_type  = var.node_group_settings.capacity_type
  disk_size      = var.node_group_settings.disk_size
  labels         = var.node_group_settings.labels

  dynamic "taint" {
      for_each = var.node_group_settings.has_taint ? [1] : []
      content {
          key    = var.node_group_settings.taint_key
          value  = var.node_group_settings.taint_value
          effect = var.node_group_settings.taint_effect
      }
  }

  tags = var.node_group_settings.tags

  lifecycle {
    create_before_destroy = true
    ignore_changes        = [scaling_config.0.desired_size]
  }

}