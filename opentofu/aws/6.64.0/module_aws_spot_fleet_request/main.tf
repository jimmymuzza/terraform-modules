resource "aws_spot_fleet_request" "spot_fleet_requests" {
  for_each = var.spot_fleet_requests

  iam_fleet_role                      = each.value.iam_fleet_role
  target_capacity                     = each.value.target_capacity
  allocation_strategy                 = each.value.allocation_strategy
  context                             = each.value.context
  excess_capacity_termination_policy  = each.value.excess_capacity_termination_policy
  fleet_type                          = each.value.fleet_type
  instance_interruption_behaviour     = each.value.instance_interruption_behaviour
  instance_pools_to_use_count         = each.value.instance_pools_to_use_count
  load_balancers                      = each.value.load_balancers
  on_demand_allocation_strategy       = each.value.on_demand_allocation_strategy
  on_demand_max_total_price           = each.value.on_demand_max_total_price
  on_demand_target_capacity           = each.value.on_demand_target_capacity
  region                              = each.value.region
  replace_unhealthy_instances         = each.value.replace_unhealthy_instances
  spot_price                          = each.value.spot_price
  tags                                = each.value.tags
  tags_all                            = each.value.tags_all
  target_capacity_unit_type           = each.value.target_capacity_unit_type
  target_group_arns                   = each.value.target_group_arns
  terminate_instances_on_delete       = each.value.terminate_instances_on_delete
  terminate_instances_with_expiration = each.value.terminate_instances_with_expiration
  valid_from                          = each.value.valid_from
  valid_until                         = each.value.valid_until
  wait_for_fulfillment                = each.value.wait_for_fulfillment

  dynamic "launch_specification" {
    for_each = each.value.launch_specification != null ? each.value.launch_specification : []
    content {
      ami                         = launch_specification.value.ami
      instance_type               = launch_specification.value.instance_type
      associate_public_ip_address = launch_specification.value.associate_public_ip_address
      availability_zone           = launch_specification.value.availability_zone
      ebs_optimized               = launch_specification.value.ebs_optimized
      iam_instance_profile        = launch_specification.value.iam_instance_profile
      iam_instance_profile_arn    = launch_specification.value.iam_instance_profile_arn
      key_name                    = launch_specification.value.key_name
      monitoring                  = launch_specification.value.monitoring
      placement_group             = launch_specification.value.placement_group
      placement_tenancy           = launch_specification.value.placement_tenancy
      spot_price                  = launch_specification.value.spot_price
      subnet_id                   = launch_specification.value.subnet_id
      tags                        = launch_specification.value.tags
      user_data                   = launch_specification.value.user_data
      vpc_security_group_ids      = launch_specification.value.vpc_security_group_ids
      weighted_capacity           = launch_specification.value.weighted_capacity

      dynamic "ebs_block_device" {
        for_each = launch_specification.value.ebs_block_device != null ? launch_specification.value.ebs_block_device : []
        content {
          device_name           = ebs_block_device.value.device_name
          delete_on_termination = ebs_block_device.value.delete_on_termination
          encrypted             = ebs_block_device.value.encrypted
          iops                  = ebs_block_device.value.iops
          kms_key_id            = ebs_block_device.value.kms_key_id
          snapshot_id           = ebs_block_device.value.snapshot_id
          throughput            = ebs_block_device.value.throughput
          volume_size           = ebs_block_device.value.volume_size
          volume_type           = ebs_block_device.value.volume_type
        }
      }

      dynamic "ephemeral_block_device" {
        for_each = launch_specification.value.ephemeral_block_device != null ? launch_specification.value.ephemeral_block_device : []
        content {
          device_name  = ephemeral_block_device.value.device_name
          virtual_name = ephemeral_block_device.value.virtual_name
        }
      }

      dynamic "root_block_device" {
        for_each = launch_specification.value.root_block_device != null ? launch_specification.value.root_block_device : []
        content {
          delete_on_termination = root_block_device.value.delete_on_termination
          encrypted             = root_block_device.value.encrypted
          iops                  = root_block_device.value.iops
          kms_key_id            = root_block_device.value.kms_key_id
          throughput            = root_block_device.value.throughput
          volume_size           = root_block_device.value.volume_size
          volume_type           = root_block_device.value.volume_type
        }
      }
    }
  }

  dynamic "launch_template_config" {
    for_each = each.value.launch_template_config != null ? each.value.launch_template_config : []
    content {

      dynamic "launch_template_specification" {
        for_each = launch_template_config.value.launch_template_specification != null ? launch_template_config.value.launch_template_specification : []
        content {
          name    = launch_template_specification.value.name
          version = launch_template_specification.value.version
        }
      }

      dynamic "overrides" {
        for_each = launch_template_config.value.overrides != null ? launch_template_config.value.overrides : []
        content {
          availability_zone = overrides.value.availability_zone
          instance_type     = overrides.value.instance_type
          priority          = overrides.value.priority
          spot_price        = overrides.value.spot_price
          subnet_id         = overrides.value.subnet_id
          weighted_capacity = overrides.value.weighted_capacity

          dynamic "instance_requirements" {
            for_each = overrides.value.instance_requirements != null ? overrides.value.instance_requirements : []
            content {
              accelerator_manufacturers                        = instance_requirements.value.accelerator_manufacturers
              accelerator_names                                = instance_requirements.value.accelerator_names
              accelerator_types                                = instance_requirements.value.accelerator_types
              allowed_instance_types                           = instance_requirements.value.allowed_instance_types
              bare_metal                                       = instance_requirements.value.bare_metal
              burstable_performance                            = instance_requirements.value.burstable_performance
              cpu_manufacturers                                = instance_requirements.value.cpu_manufacturers
              excluded_instance_types                          = instance_requirements.value.excluded_instance_types
              instance_generations                             = instance_requirements.value.instance_generations
              local_storage                                    = instance_requirements.value.local_storage
              local_storage_types                              = instance_requirements.value.local_storage_types
              on_demand_max_price_percentage_over_lowest_price = instance_requirements.value.on_demand_max_price_percentage_over_lowest_price
              require_hibernate_support                        = instance_requirements.value.require_hibernate_support
              spot_max_price_percentage_over_lowest_price      = instance_requirements.value.spot_max_price_percentage_over_lowest_price

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
        }
      }
    }
  }

  dynamic "spot_maintenance_strategies" {
    for_each = each.value.spot_maintenance_strategies != null ? each.value.spot_maintenance_strategies : []
    content {

      dynamic "capacity_rebalance" {
        for_each = spot_maintenance_strategies.value.capacity_rebalance != null ? spot_maintenance_strategies.value.capacity_rebalance : []
        content {
          replacement_strategy = capacity_rebalance.value.replacement_strategy
        }
      }
    }
  }
}
