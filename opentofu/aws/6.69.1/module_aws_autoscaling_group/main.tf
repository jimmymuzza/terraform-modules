resource "aws_autoscaling_group" "autoscaling_groups" {
  for_each = var.autoscaling_groups

  max_size                         = each.value.max_size
  min_size                         = each.value.min_size
  availability_zones               = each.value.availability_zones
  capacity_rebalance               = each.value.capacity_rebalance
  context                          = each.value.context
  default_cooldown                 = each.value.default_cooldown
  default_instance_warmup          = each.value.default_instance_warmup
  desired_capacity                 = each.value.desired_capacity
  desired_capacity_type            = each.value.desired_capacity_type
  enabled_metrics                  = each.value.enabled_metrics
  force_delete                     = each.value.force_delete
  force_delete_warm_pool           = each.value.force_delete_warm_pool
  health_check_grace_period        = each.value.health_check_grace_period
  health_check_type                = each.value.health_check_type
  ignore_failed_scaling_activities = each.value.ignore_failed_scaling_activities
  launch_configuration             = each.value.launch_configuration
  load_balancers                   = each.value.load_balancers
  max_instance_lifetime            = each.value.max_instance_lifetime
  metrics_granularity              = each.value.metrics_granularity
  min_elb_capacity                 = each.value.min_elb_capacity
  name                             = each.value.name
  name_prefix                      = each.value.name_prefix
  placement_group                  = each.value.placement_group
  protect_from_scale_in            = each.value.protect_from_scale_in
  region                           = each.value.region
  service_linked_role_arn          = each.value.service_linked_role_arn
  suspended_processes              = each.value.suspended_processes
  target_group_arns                = each.value.target_group_arns
  termination_policies             = each.value.termination_policies
  vpc_zone_identifier              = each.value.vpc_zone_identifier
  wait_for_capacity_timeout        = each.value.wait_for_capacity_timeout
  wait_for_elb_capacity            = each.value.wait_for_elb_capacity

  dynamic "availability_zone_distribution" {
    for_each = each.value.availability_zone_distribution != null ? each.value.availability_zone_distribution : []
    content {
      capacity_distribution_strategy = availability_zone_distribution.value.capacity_distribution_strategy
    }
  }

  dynamic "capacity_reservation_specification" {
    for_each = each.value.capacity_reservation_specification != null ? each.value.capacity_reservation_specification : []
    content {
      capacity_reservation_preference = capacity_reservation_specification.value.capacity_reservation_preference

      dynamic "capacity_reservation_target" {
        for_each = capacity_reservation_specification.value.capacity_reservation_target != null ? capacity_reservation_specification.value.capacity_reservation_target : []
        content {
          capacity_reservation_ids                 = capacity_reservation_target.value.capacity_reservation_ids
          capacity_reservation_resource_group_arns = capacity_reservation_target.value.capacity_reservation_resource_group_arns
        }
      }
    }
  }

  dynamic "initial_lifecycle_hook" {
    for_each = each.value.initial_lifecycle_hook != null ? each.value.initial_lifecycle_hook : []
    content {
      lifecycle_transition    = initial_lifecycle_hook.value.lifecycle_transition
      name                    = initial_lifecycle_hook.value.name
      default_result          = initial_lifecycle_hook.value.default_result
      heartbeat_timeout       = initial_lifecycle_hook.value.heartbeat_timeout
      notification_metadata   = initial_lifecycle_hook.value.notification_metadata
      notification_target_arn = initial_lifecycle_hook.value.notification_target_arn
      role_arn                = initial_lifecycle_hook.value.role_arn
    }
  }

  dynamic "instance_lifecycle_policy" {
    for_each = each.value.instance_lifecycle_policy != null ? each.value.instance_lifecycle_policy : []
    content {

      dynamic "retention_triggers" {
        for_each = instance_lifecycle_policy.value.retention_triggers != null ? instance_lifecycle_policy.value.retention_triggers : []
        content {
          terminate_hook_abandon = retention_triggers.value.terminate_hook_abandon
        }
      }
    }
  }

  dynamic "instance_maintenance_policy" {
    for_each = each.value.instance_maintenance_policy != null ? each.value.instance_maintenance_policy : []
    content {
      max_healthy_percentage = instance_maintenance_policy.value.max_healthy_percentage
      min_healthy_percentage = instance_maintenance_policy.value.min_healthy_percentage
    }
  }

  dynamic "instance_refresh" {
    for_each = each.value.instance_refresh != null ? each.value.instance_refresh : []
    content {
      strategy = instance_refresh.value.strategy
      triggers = instance_refresh.value.triggers

      dynamic "preferences" {
        for_each = instance_refresh.value.preferences != null ? instance_refresh.value.preferences : []
        content {
          auto_rollback                = preferences.value.auto_rollback
          checkpoint_delay             = preferences.value.checkpoint_delay
          checkpoint_percentages       = preferences.value.checkpoint_percentages
          instance_warmup              = preferences.value.instance_warmup
          max_healthy_percentage       = preferences.value.max_healthy_percentage
          min_healthy_percentage       = preferences.value.min_healthy_percentage
          scale_in_protected_instances = preferences.value.scale_in_protected_instances
          skip_matching                = preferences.value.skip_matching
          standby_instances            = preferences.value.standby_instances

          dynamic "alarm_specification" {
            for_each = preferences.value.alarm_specification != null ? preferences.value.alarm_specification : []
            content {
              alarms = alarm_specification.value.alarms
            }
          }
        }
      }
    }
  }

  dynamic "launch_template" {
    for_each = each.value.launch_template != null ? each.value.launch_template : []
    content {
      name    = launch_template.value.name
      version = launch_template.value.version
    }
  }

  dynamic "mixed_instances_policy" {
    for_each = each.value.mixed_instances_policy != null ? each.value.mixed_instances_policy : []
    content {

      dynamic "instances_distribution" {
        for_each = mixed_instances_policy.value.instances_distribution != null ? mixed_instances_policy.value.instances_distribution : []
        content {
          on_demand_allocation_strategy            = instances_distribution.value.on_demand_allocation_strategy
          on_demand_base_capacity                  = instances_distribution.value.on_demand_base_capacity
          on_demand_percentage_above_base_capacity = instances_distribution.value.on_demand_percentage_above_base_capacity
          spot_allocation_strategy                 = instances_distribution.value.spot_allocation_strategy
          spot_instance_pools                      = instances_distribution.value.spot_instance_pools
          spot_max_price                           = instances_distribution.value.spot_max_price
        }
      }

      dynamic "launch_template" {
        for_each = mixed_instances_policy.value.launch_template != null ? mixed_instances_policy.value.launch_template : []
        content {

          dynamic "launch_template_specification" {
            for_each = launch_template.value.launch_template_specification != null ? launch_template.value.launch_template_specification : []
            content {
              launch_template_id   = launch_template_specification.value.launch_template_id
              launch_template_name = launch_template_specification.value.launch_template_name
              version              = launch_template_specification.value.version
            }
          }

          dynamic "override" {
            for_each = launch_template.value.override != null ? launch_template.value.override : []
            content {
              instance_type     = override.value.instance_type
              weighted_capacity = override.value.weighted_capacity

              dynamic "instance_requirements" {
                for_each = override.value.instance_requirements != null ? override.value.instance_requirements : []
                content {
                  accelerator_manufacturers                               = instance_requirements.value.accelerator_manufacturers
                  accelerator_names                                       = instance_requirements.value.accelerator_names
                  accelerator_types                                       = instance_requirements.value.accelerator_types
                  allowed_instance_types                                  = instance_requirements.value.allowed_instance_types
                  bare_metal                                              = instance_requirements.value.bare_metal
                  burstable_performance                                   = instance_requirements.value.burstable_performance
                  cpu_manufacturers                                       = instance_requirements.value.cpu_manufacturers
                  excluded_instance_types                                 = instance_requirements.value.excluded_instance_types
                  instance_generations                                    = instance_requirements.value.instance_generations
                  local_storage                                           = instance_requirements.value.local_storage
                  local_storage_types                                     = instance_requirements.value.local_storage_types
                  max_spot_price_as_percentage_of_optimal_on_demand_price = instance_requirements.value.max_spot_price_as_percentage_of_optimal_on_demand_price
                  on_demand_max_price_percentage_over_lowest_price        = instance_requirements.value.on_demand_max_price_percentage_over_lowest_price
                  require_hibernate_support                               = instance_requirements.value.require_hibernate_support
                  spot_max_price_percentage_over_lowest_price             = instance_requirements.value.spot_max_price_percentage_over_lowest_price

                  dynamic "accelerator_count" {
                    for_each = instance_requirements.value.accelerator_count != null ? instance_requirements.value.accelerator_count : []
                    content {
                      max = accelerator_count.value.max
                      min = accelerator_count.value.min
                    }
                  }

                  dynamic "accelerator_total_memory_mib" {
                    for_each = instance_requirements.value.accelerator_total_memory_mib != null ? instance_requirements.value.accelerator_total_memory_mib : []
                    content {
                      max = accelerator_total_memory_mib.value.max
                      min = accelerator_total_memory_mib.value.min
                    }
                  }

                  dynamic "baseline_ebs_bandwidth_mbps" {
                    for_each = instance_requirements.value.baseline_ebs_bandwidth_mbps != null ? instance_requirements.value.baseline_ebs_bandwidth_mbps : []
                    content {
                      max = baseline_ebs_bandwidth_mbps.value.max
                      min = baseline_ebs_bandwidth_mbps.value.min
                    }
                  }

                  dynamic "memory_gib_per_vcpu" {
                    for_each = instance_requirements.value.memory_gib_per_vcpu != null ? instance_requirements.value.memory_gib_per_vcpu : []
                    content {
                      max = memory_gib_per_vcpu.value.max
                      min = memory_gib_per_vcpu.value.min
                    }
                  }

                  dynamic "memory_mib" {
                    for_each = instance_requirements.value.memory_mib != null ? instance_requirements.value.memory_mib : []
                    content {
                      max = memory_mib.value.max
                      min = memory_mib.value.min
                    }
                  }

                  dynamic "network_bandwidth_gbps" {
                    for_each = instance_requirements.value.network_bandwidth_gbps != null ? instance_requirements.value.network_bandwidth_gbps : []
                    content {
                      max = network_bandwidth_gbps.value.max
                      min = network_bandwidth_gbps.value.min
                    }
                  }

                  dynamic "network_interface_count" {
                    for_each = instance_requirements.value.network_interface_count != null ? instance_requirements.value.network_interface_count : []
                    content {
                      max = network_interface_count.value.max
                      min = network_interface_count.value.min
                    }
                  }

                  dynamic "total_local_storage_gb" {
                    for_each = instance_requirements.value.total_local_storage_gb != null ? instance_requirements.value.total_local_storage_gb : []
                    content {
                      max = total_local_storage_gb.value.max
                      min = total_local_storage_gb.value.min
                    }
                  }

                  dynamic "vcpu_count" {
                    for_each = instance_requirements.value.vcpu_count != null ? instance_requirements.value.vcpu_count : []
                    content {
                      max = vcpu_count.value.max
                      min = vcpu_count.value.min
                    }
                  }
                }
              }

              dynamic "launch_template_specification" {
                for_each = override.value.launch_template_specification != null ? override.value.launch_template_specification : []
                content {
                  launch_template_id   = launch_template_specification.value.launch_template_id
                  launch_template_name = launch_template_specification.value.launch_template_name
                  version              = launch_template_specification.value.version
                }
              }
            }
          }
        }
      }
    }
  }

  dynamic "tag" {
    for_each = each.value.tag != null ? each.value.tag : []
    content {
      key                 = tag.value.key
      propagate_at_launch = tag.value.propagate_at_launch
      value               = tag.value.value
    }
  }

  dynamic "traffic_source" {
    for_each = each.value.traffic_source != null ? each.value.traffic_source : []
    content {
      identifier = traffic_source.value.identifier
      type       = traffic_source.value.type
    }
  }

  dynamic "warm_pool" {
    for_each = each.value.warm_pool != null ? each.value.warm_pool : []
    content {
      max_group_prepared_capacity = warm_pool.value.max_group_prepared_capacity
      min_size                    = warm_pool.value.min_size
      pool_state                  = warm_pool.value.pool_state

      dynamic "instance_reuse_policy" {
        for_each = warm_pool.value.instance_reuse_policy != null ? warm_pool.value.instance_reuse_policy : []
        content {
          reuse_on_scale_in = instance_reuse_policy.value.reuse_on_scale_in
        }
      }
    }
  }
}
