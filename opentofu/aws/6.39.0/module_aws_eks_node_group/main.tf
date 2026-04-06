resource "aws_eks_node_group" "eks_node_groups" {
  for_each = var.eks_node_groups

  cluster_name           = each.value.cluster_name
  node_role_arn          = each.value.node_role_arn
  subnet_ids             = each.value.subnet_ids
  ami_type               = each.value.ami_type
  capacity_type          = each.value.capacity_type
  disk_size              = each.value.disk_size
  force_update_version   = each.value.force_update_version
  instance_types         = each.value.instance_types
  labels                 = each.value.labels
  node_group_name        = each.value.node_group_name
  node_group_name_prefix = each.value.node_group_name_prefix
  region                 = each.value.region
  release_version        = each.value.release_version
  tags                   = each.value.tags
  tags_all               = each.value.tags_all
  version                = each.value.version

  dynamic "launch_template" {
    for_each = each.value.launch_template != null ? each.value.launch_template : []
    content {
      version = launch_template.value.version
      name    = launch_template.value.name
    }
  }

  dynamic "node_repair_config" {
    for_each = each.value.node_repair_config != null ? each.value.node_repair_config : []
    content {
      enabled                                 = node_repair_config.value.enabled
      max_parallel_nodes_repaired_count       = node_repair_config.value.max_parallel_nodes_repaired_count
      max_parallel_nodes_repaired_percentage  = node_repair_config.value.max_parallel_nodes_repaired_percentage
      max_unhealthy_node_threshold_count      = node_repair_config.value.max_unhealthy_node_threshold_count
      max_unhealthy_node_threshold_percentage = node_repair_config.value.max_unhealthy_node_threshold_percentage

      dynamic "node_repair_config_overrides" {
        for_each = node_repair_config.value.node_repair_config_overrides != null ? node_repair_config.value.node_repair_config_overrides : []
        content {
          min_repair_wait_time_mins = node_repair_config_overrides.value.min_repair_wait_time_mins
          node_monitoring_condition = node_repair_config_overrides.value.node_monitoring_condition
          node_unhealthy_reason     = node_repair_config_overrides.value.node_unhealthy_reason
          repair_action             = node_repair_config_overrides.value.repair_action
        }
      }
    }
  }

  dynamic "remote_access" {
    for_each = each.value.remote_access != null ? each.value.remote_access : []
    content {
      ec2_ssh_key               = remote_access.value.ec2_ssh_key
      source_security_group_ids = remote_access.value.source_security_group_ids
    }
  }

  dynamic "scaling_config" {
    for_each = each.value.scaling_config != null ? each.value.scaling_config : []
    content {
      desired_size = scaling_config.value.desired_size
      max_size     = scaling_config.value.max_size
      min_size     = scaling_config.value.min_size
    }
  }

  dynamic "taint" {
    for_each = each.value.taint != null ? each.value.taint : []
    content {
      effect = taint.value.effect
      key    = taint.value.key
      value  = taint.value.value
    }
  }

  dynamic "update_config" {
    for_each = each.value.update_config != null ? each.value.update_config : []
    content {
      max_unavailable            = update_config.value.max_unavailable
      max_unavailable_percentage = update_config.value.max_unavailable_percentage
      update_strategy            = update_config.value.update_strategy
    }
  }
}
