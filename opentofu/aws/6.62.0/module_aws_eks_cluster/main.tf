resource "aws_eks_cluster" "eks_clusters" {
  for_each = var.eks_clusters

  name                          = each.value.name
  role_arn                      = each.value.role_arn
  bootstrap_self_managed_addons = each.value.bootstrap_self_managed_addons
  deletion_protection           = each.value.deletion_protection
  enabled_cluster_log_types     = each.value.enabled_cluster_log_types
  force_update_version          = each.value.force_update_version
  region                        = each.value.region
  tags                          = each.value.tags
  tags_all                      = each.value.tags_all
  version                       = each.value.version

  dynamic "access_config" {
    for_each = each.value.access_config != null ? each.value.access_config : []
    content {
      authentication_mode                         = access_config.value.authentication_mode
      bootstrap_cluster_creator_admin_permissions = access_config.value.bootstrap_cluster_creator_admin_permissions
    }
  }

  dynamic "compute_config" {
    for_each = each.value.compute_config != null ? each.value.compute_config : []
    content {
      enabled       = compute_config.value.enabled
      node_pools    = compute_config.value.node_pools
      node_role_arn = compute_config.value.node_role_arn
    }
  }

  dynamic "control_plane_scaling_config" {
    for_each = each.value.control_plane_scaling_config != null ? each.value.control_plane_scaling_config : []
    content {
      tier = control_plane_scaling_config.value.tier
    }
  }

  dynamic "encryption_config" {
    for_each = each.value.encryption_config != null ? each.value.encryption_config : []
    content {
      resources = encryption_config.value.resources

      dynamic "provider" {
        for_each = encryption_config.value.provider != null ? encryption_config.value.provider : []
        content {
          key_arn = provider.value.key_arn
        }
      }
    }
  }

  dynamic "kube_api_server_config" {
    for_each = each.value.kube_api_server_config != null ? each.value.kube_api_server_config : []
    content {
      event_ttl = kube_api_server_config.value.event_ttl

      dynamic "service_node_port_range" {
        for_each = kube_api_server_config.value.service_node_port_range != null ? kube_api_server_config.value.service_node_port_range : []
        content {
          max_port = service_node_port_range.value.max_port
          min_port = service_node_port_range.value.min_port
        }
      }
    }
  }

  dynamic "kube_controller_manager_config" {
    for_each = each.value.kube_controller_manager_config != null ? each.value.kube_controller_manager_config : []
    content {

      dynamic "horizontal_pod_autoscaler_controller_config" {
        for_each = kube_controller_manager_config.value.horizontal_pod_autoscaler_controller_config != null ? kube_controller_manager_config.value.horizontal_pod_autoscaler_controller_config : []
        content {
          horizontal_pod_autoscaler_sync_period = horizontal_pod_autoscaler_controller_config.value.horizontal_pod_autoscaler_sync_period
        }
      }
    }
  }

  dynamic "kube_scheduler_config" {
    for_each = each.value.kube_scheduler_config != null ? each.value.kube_scheduler_config : []
    content {

      dynamic "node_resources_fit" {
        for_each = kube_scheduler_config.value.node_resources_fit != null ? kube_scheduler_config.value.node_resources_fit : []
        content {

          dynamic "scoring_strategy" {
            for_each = node_resources_fit.value.scoring_strategy != null ? node_resources_fit.value.scoring_strategy : []
            content {
              type = scoring_strategy.value.type

              dynamic "resource" {
                for_each = scoring_strategy.value.resource != null ? scoring_strategy.value.resource : []
                content {
                  name   = resource.value.name
                  weight = resource.value.weight
                }
              }
            }
          }
        }
      }
    }
  }

  dynamic "kubernetes_network_config" {
    for_each = each.value.kubernetes_network_config != null ? each.value.kubernetes_network_config : []
    content {
      ip_family         = kubernetes_network_config.value.ip_family
      service_ipv4_cidr = kubernetes_network_config.value.service_ipv4_cidr

      dynamic "elastic_load_balancing" {
        for_each = kubernetes_network_config.value.elastic_load_balancing != null ? kubernetes_network_config.value.elastic_load_balancing : []
        content {
          enabled = elastic_load_balancing.value.enabled
        }
      }
    }
  }

  dynamic "outpost_config" {
    for_each = each.value.outpost_config != null ? each.value.outpost_config : []
    content {
      control_plane_instance_type = outpost_config.value.control_plane_instance_type
      outpost_arns                = outpost_config.value.outpost_arns
      etcd_instance_type          = outpost_config.value.etcd_instance_type

      dynamic "control_plane_placement" {
        for_each = outpost_config.value.control_plane_placement != null ? outpost_config.value.control_plane_placement : []
        content {
          group_name   = control_plane_placement.value.group_name
          spread_level = control_plane_placement.value.spread_level
        }
      }

      dynamic "etcd_placement" {
        for_each = outpost_config.value.etcd_placement != null ? outpost_config.value.etcd_placement : []
        content {
          spread_level = etcd_placement.value.spread_level
        }
      }
    }
  }

  dynamic "remote_network_config" {
    for_each = each.value.remote_network_config != null ? each.value.remote_network_config : []
    content {

      dynamic "remote_node_networks" {
        for_each = remote_network_config.value.remote_node_networks != null ? remote_network_config.value.remote_node_networks : []
        content {
          cidrs = remote_node_networks.value.cidrs
        }
      }

      dynamic "remote_pod_networks" {
        for_each = remote_network_config.value.remote_pod_networks != null ? remote_network_config.value.remote_pod_networks : []
        content {
          cidrs = remote_pod_networks.value.cidrs
        }
      }
    }
  }

  dynamic "storage_config" {
    for_each = each.value.storage_config != null ? each.value.storage_config : []
    content {

      dynamic "block_storage" {
        for_each = storage_config.value.block_storage != null ? storage_config.value.block_storage : []
        content {
          enabled = block_storage.value.enabled
        }
      }
    }
  }

  dynamic "upgrade_policy" {
    for_each = each.value.upgrade_policy != null ? each.value.upgrade_policy : []
    content {
      support_type = upgrade_policy.value.support_type
    }
  }

  dynamic "vpc_config" {
    for_each = each.value.vpc_config != null ? each.value.vpc_config : []
    content {
      subnet_ids                = vpc_config.value.subnet_ids
      control_plane_egress_mode = vpc_config.value.control_plane_egress_mode
      endpoint_private_access   = vpc_config.value.endpoint_private_access
      endpoint_public_access    = vpc_config.value.endpoint_public_access
      public_access_cidrs       = vpc_config.value.public_access_cidrs
      security_group_ids        = vpc_config.value.security_group_ids
    }
  }

  dynamic "zonal_shift_config" {
    for_each = each.value.zonal_shift_config != null ? each.value.zonal_shift_config : []
    content {
      enabled = zonal_shift_config.value.enabled
    }
  }
}
