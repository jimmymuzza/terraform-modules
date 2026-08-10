resource "aws_ecs_capacity_provider" "ecs_capacity_providers" {
  for_each = var.ecs_capacity_providers

  name     = each.value.name
  cluster  = each.value.cluster
  region   = each.value.region
  tags     = each.value.tags
  tags_all = each.value.tags_all

  dynamic "auto_scaling_group_provider" {
    for_each = each.value.auto_scaling_group_provider != null ? each.value.auto_scaling_group_provider : []
    content {
      auto_scaling_group_arn         = auto_scaling_group_provider.value.auto_scaling_group_arn
      managed_draining               = auto_scaling_group_provider.value.managed_draining
      managed_termination_protection = auto_scaling_group_provider.value.managed_termination_protection

      dynamic "managed_scaling" {
        for_each = auto_scaling_group_provider.value.managed_scaling != null ? auto_scaling_group_provider.value.managed_scaling : []
        content {
          instance_warmup_period    = managed_scaling.value.instance_warmup_period
          maximum_scaling_step_size = managed_scaling.value.maximum_scaling_step_size
          minimum_scaling_step_size = managed_scaling.value.minimum_scaling_step_size
          status                    = managed_scaling.value.status
          target_capacity           = managed_scaling.value.target_capacity
        }
      }
    }
  }

  dynamic "managed_instances_provider" {
    for_each = each.value.managed_instances_provider != null ? each.value.managed_instances_provider : []
    content {
      infrastructure_role_arn = managed_instances_provider.value.infrastructure_role_arn
      propagate_tags          = managed_instances_provider.value.propagate_tags

      dynamic "infrastructure_optimization" {
        for_each = managed_instances_provider.value.infrastructure_optimization != null ? managed_instances_provider.value.infrastructure_optimization : []
        content {
          scale_in_after = infrastructure_optimization.value.scale_in_after
        }
      }

      dynamic "instance_launch_template" {
        for_each = managed_instances_provider.value.instance_launch_template != null ? managed_instances_provider.value.instance_launch_template : []
        content {
          ec2_instance_profile_arn = instance_launch_template.value.ec2_instance_profile_arn
          capacity_option_type     = instance_launch_template.value.capacity_option_type
          monitoring               = instance_launch_template.value.monitoring

          dynamic "capacity_reservations" {
            for_each = instance_launch_template.value.capacity_reservations != null ? instance_launch_template.value.capacity_reservations : []
            content {
              reservation_group_arn  = capacity_reservations.value.reservation_group_arn
              reservation_preference = capacity_reservations.value.reservation_preference
            }
          }

          dynamic "instance_requirements" {
            for_each = instance_launch_template.value.instance_requirements != null ? instance_launch_template.value.instance_requirements : []
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
                  min = memory_mib.value.min
                  max = memory_mib.value.max
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
                  min = vcpu_count.value.min
                  max = vcpu_count.value.max
                }
              }
            }
          }

          dynamic "local_storage_configuration" {
            for_each = instance_launch_template.value.local_storage_configuration != null ? instance_launch_template.value.local_storage_configuration : []
            content {
              use_local_storage = local_storage_configuration.value.use_local_storage
            }
          }

          dynamic "network_configuration" {
            for_each = instance_launch_template.value.network_configuration != null ? instance_launch_template.value.network_configuration : []
            content {
              subnets         = network_configuration.value.subnets
              security_groups = network_configuration.value.security_groups
            }
          }

          dynamic "storage_configuration" {
            for_each = instance_launch_template.value.storage_configuration != null ? instance_launch_template.value.storage_configuration : []
            content {
              storage_size_gib = storage_configuration.value.storage_size_gib
            }
          }
        }
      }
    }
  }
}
