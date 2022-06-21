variable "primary_node_group_settings" {
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

  default = {
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
}