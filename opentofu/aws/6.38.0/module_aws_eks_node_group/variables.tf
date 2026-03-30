variable "eks_node_groups" {
  description = <<EOT
Map of eks_node_groups, attributes below
Required:
    - cluster_name
    - node_role_arn
    - subnet_ids
    - scaling_config
Optional:
    - ami_type
    - capacity_type
    - disk_size
    - force_update_version
    - instance_types
    - labels
    - node_group_name
    - node_group_name_prefix
    - region
    - release_version
    - tags
    - tags_all
    - version
    - launch_template
    - node_repair_config
    - remote_access
    - taint
    - update_config
EOT

  type = map(object({
    cluster_name           = string
    node_role_arn          = string
    subnet_ids             = set(string)
    ami_type               = optional(string)
    capacity_type          = optional(string)
    disk_size              = optional(number)
    force_update_version   = optional(bool)
    instance_types         = optional(list(string))
    labels                 = optional(map(string))
    node_group_name        = optional(string)
    node_group_name_prefix = optional(string)
    region                 = optional(string)
    release_version        = optional(string)
    tags                   = optional(map(string))
    tags_all               = optional(map(string))
    version                = optional(string)
    launch_template        = optional(list(object({
            version = string
            name    = optional(string)
        })))
    node_repair_config     = optional(list(object({
            enabled                                 = optional(bool)
            max_parallel_nodes_repaired_count       = optional(number)
            max_parallel_nodes_repaired_percentage  = optional(number)
            max_unhealthy_node_threshold_count      = optional(number)
            max_unhealthy_node_threshold_percentage = optional(number)
            node_repair_config_overrides            = optional(list(object({
                min_repair_wait_time_mins = number
                node_monitoring_condition = string
                node_unhealthy_reason     = string
                repair_action             = string
            })))
        })))
    remote_access          = optional(list(object({
            ec2_ssh_key               = optional(string)
            source_security_group_ids = optional(set(string))
        })))
    scaling_config         = list(object({
            desired_size = number
            max_size     = number
            min_size     = number
        }))
    taint                  = optional(set(object({
            effect = string
            key    = string
            value  = optional(string)
        })))
    update_config          = optional(list(object({
            max_unavailable            = optional(number)
            max_unavailable_percentage = optional(number)
            update_strategy            = optional(string)
        })))
  }))
}
