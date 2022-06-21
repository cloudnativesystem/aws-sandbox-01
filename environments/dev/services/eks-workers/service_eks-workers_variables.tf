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
}