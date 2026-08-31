variable "eks_clusters" {
  description = <<EOT
Map of eks_clusters, attributes below
Required:
    - name
    - role_arn
    - vpc_config
Optional:
    - bootstrap_self_managed_addons
    - deletion_protection
    - enabled_cluster_log_types
    - force_update_version
    - region
    - tags
    - tags_all
    - version
    - access_config
    - compute_config
    - control_plane_scaling_config
    - encryption_config
    - kube_api_server_config
    - kube_controller_manager_config
    - kube_scheduler_config
    - kubernetes_network_config
    - outpost_config
    - remote_network_config
    - storage_config
    - upgrade_policy
    - zonal_shift_config
EOT

  type = map(object({
    name                           = string
    role_arn                       = string
    bootstrap_self_managed_addons  = optional(bool)
    deletion_protection            = optional(bool)
    enabled_cluster_log_types      = optional(set(string))
    force_update_version           = optional(bool)
    region                         = optional(string)
    tags                           = optional(map(string))
    tags_all                       = optional(map(string))
    version                        = optional(string)
    access_config                  = optional(list(object({
            authentication_mode                         = optional(string)
            bootstrap_cluster_creator_admin_permissions = optional(bool)
        })))
    compute_config                 = optional(list(object({
            enabled       = optional(bool)
            node_pools    = optional(set(string))
            node_role_arn = optional(string)
        })))
    control_plane_scaling_config   = optional(list(object({
            tier = optional(string)
        })))
    encryption_config              = optional(list(object({
            resources = set(string)
            provider  = list(object({
                key_arn = string
            }))
        })))
    kube_api_server_config         = optional(list(object({
            event_ttl               = optional(string)
            service_node_port_range = optional(list(object({
                max_port = optional(number)
                min_port = optional(number)
            })))
        })))
    kube_controller_manager_config = optional(list(object({
            horizontal_pod_autoscaler_controller_config = optional(list(object({
                horizontal_pod_autoscaler_sync_period = optional(string)
            })))
        })))
    kube_scheduler_config          = optional(list(object({
            node_resources_fit = optional(list(object({
                scoring_strategy = optional(list(object({
                    type     = optional(string)
                    resource = optional(list(object({
                        name   = optional(string)
                        weight = optional(number)
                    })))
                })))
            })))
        })))
    kubernetes_network_config      = optional(list(object({
            ip_family              = optional(string)
            service_ipv4_cidr      = optional(string)
            elastic_load_balancing = optional(list(object({
                enabled = optional(bool)
            })))
        })))
    outpost_config                 = optional(list(object({
            control_plane_instance_type = string
            outpost_arns                = set(string)
            etcd_instance_type          = optional(string)
            control_plane_placement     = optional(list(object({
                group_name   = optional(string)
                spread_level = optional(string)
            })))
            etcd_placement              = optional(list(object({
                spread_level = optional(string)
            })))
        })))
    remote_network_config          = optional(list(object({
            remote_node_networks = optional(list(object({
                cidrs = optional(set(string))
            })))
            remote_pod_networks  = optional(list(object({
                cidrs = optional(set(string))
            })))
        })))
    storage_config                 = optional(list(object({
            block_storage = optional(list(object({
                enabled = optional(bool)
            })))
        })))
    upgrade_policy                 = optional(list(object({
            support_type = optional(string)
        })))
    vpc_config                     = list(object({
            subnet_ids                = set(string)
            control_plane_egress_mode = optional(string)
            endpoint_private_access   = optional(bool)
            endpoint_public_access    = optional(bool)
            public_access_cidrs       = optional(set(string))
            security_group_ids        = optional(set(string))
        }))
    zonal_shift_config             = optional(list(object({
            enabled = optional(bool)
        })))
  }))
}
