# eks-workers.tfvars

primary_node_group_settings = {
  name           = "primary-ng"
  desired_size   = 1
  max_size       = 3
  min_size       = 1
  instance_types = ["m5.large"]
  capacity_type  = "ON_DEMAND"
  disk_size      = 50
  labels = {
    "team" = "general-ng"
  }
  has_taint    = false
  taint_key    = "NA"
  taint_value  = "NA"
  taint_effect = "NA"
  tags = {
    "Environment" = "dev"
    "Owner"       = "swagwatch"
    "Cost-Center" = "general"
  }
}

#--------------------------------------------------------------------------

