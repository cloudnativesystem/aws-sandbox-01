# 

locals {
  cluster_name = "${var.cluster_name}-${var.environment}-eks-${random_string.suffix.result}"
}

#--------------------------------------------------------------------------

