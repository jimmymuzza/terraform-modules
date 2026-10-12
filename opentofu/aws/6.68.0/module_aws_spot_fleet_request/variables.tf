variable "spot_fleet_requests" {
  description = <<EOT
Map of spot_fleet_requests, attributes below
Required:
    - iam_fleet_role
    - target_capacity
Optional:
    - allocation_strategy
    - context
    - excess_capacity_termination_policy
    - fleet_type
    - instance_interruption_behaviour
    - instance_pools_to_use_count
    - load_balancers
    - on_demand_allocation_strategy
    - on_demand_max_total_price
    - on_demand_target_capacity
    - region
    - replace_unhealthy_instances
    - spot_price
    - tags
    - tags_all
    - target_capacity_unit_type
    - target_group_arns
    - terminate_instances_on_delete
    - terminate_instances_with_expiration
    - valid_from
    - valid_until
    - wait_for_fulfillment
    - launch_specification
    - launch_template_config
    - spot_maintenance_strategies
EOT

  type = map(object({
    iam_fleet_role                      = string
    target_capacity                     = number
    allocation_strategy                 = optional(string)
    context                             = optional(string)
    excess_capacity_termination_policy  = optional(string)
    fleet_type                          = optional(string)
    instance_interruption_behaviour     = optional(string)
    instance_pools_to_use_count         = optional(number)
    load_balancers                      = optional(set(string))
    on_demand_allocation_strategy       = optional(string)
    on_demand_max_total_price           = optional(string)
    on_demand_target_capacity           = optional(number)
    region                              = optional(string)
    replace_unhealthy_instances         = optional(bool)
    spot_price                          = optional(string)
    tags                                = optional(map(string))
    tags_all                            = optional(map(string))
    target_capacity_unit_type           = optional(string)
    target_group_arns                   = optional(set(string))
    terminate_instances_on_delete       = optional(string)
    terminate_instances_with_expiration = optional(bool)
    valid_from                          = optional(string)
    valid_until                         = optional(string)
    wait_for_fulfillment                = optional(bool)
    launch_specification                = optional(set(object({
            ami                         = string
            instance_type               = string
            associate_public_ip_address = optional(bool)
            availability_zone           = optional(string)
            ebs_optimized               = optional(bool)
            iam_instance_profile        = optional(string)
            iam_instance_profile_arn    = optional(string)
            key_name                    = optional(string)
            monitoring                  = optional(bool)
            placement_group             = optional(string)
            placement_tenancy           = optional(string)
            spot_price                  = optional(string)
            subnet_id                   = optional(string)
            tags                        = optional(map(string))
            user_data                   = optional(string)
            vpc_security_group_ids      = optional(set(string))
            weighted_capacity           = optional(string)
            ebs_block_device            = optional(set(object({
                device_name           = string
                delete_on_termination = optional(bool)
                encrypted             = optional(bool)
                iops                  = optional(number)
                kms_key_id            = optional(string)
                snapshot_id           = optional(string)
                throughput            = optional(number)
                volume_size           = optional(number)
                volume_type           = optional(string)
            })))
            ephemeral_block_device      = optional(set(object({
                device_name  = string
                virtual_name = string
            })))
            root_block_device           = optional(set(object({
                delete_on_termination = optional(bool)
                encrypted             = optional(bool)
                iops                  = optional(number)
                kms_key_id            = optional(string)
                throughput            = optional(number)
                volume_size           = optional(number)
                volume_type           = optional(string)
            })))
        })))
    launch_template_config              = optional(set(object({
            launch_template_specification = list(object({
                name    = optional(string)
                version = optional(string)
            }))
            overrides                     = optional(set(object({
                availability_zone     = optional(string)
                instance_type         = optional(string)
                priority              = optional(number)
                spot_price            = optional(string)
                subnet_id             = optional(string)
                weighted_capacity     = optional(number)
                instance_requirements = optional(list(object({
                    accelerator_manufacturers                        = optional(set(string))
                    accelerator_names                                = optional(set(string))
                    accelerator_types                                = optional(set(string))
                    allowed_instance_types                           = optional(set(string))
                    bare_metal                                       = optional(string)
                    burstable_performance                            = optional(string)
                    cpu_manufacturers                                = optional(set(string))
                    excluded_instance_types                          = optional(set(string))
                    instance_generations                             = optional(set(string))
                    local_storage                                    = optional(string)
                    local_storage_types                              = optional(set(string))
                    on_demand_max_price_percentage_over_lowest_price = optional(number)
                    require_hibernate_support                        = optional(bool)
                    spot_max_price_percentage_over_lowest_price      = optional(number)
                    accelerator_count                                = optional(list(object({
                        max = optional(number)
                        min = optional(number)
                    })))
                    accelerator_total_memory_mib                     = optional(list(object({
                        max = optional(number)
                        min = optional(number)
                    })))
                    baseline_ebs_bandwidth_mbps                      = optional(list(object({
                        max = optional(number)
                        min = optional(number)
                    })))
                    memory_gib_per_vcpu                              = optional(list(object({
                        max = optional(number)
                        min = optional(number)
                    })))
                    memory_mib                                       = optional(list(object({
                        max = optional(number)
                        min = optional(number)
                    })))
                    network_bandwidth_gbps                           = optional(list(object({
                        max = optional(number)
                        min = optional(number)
                    })))
                    network_interface_count                          = optional(list(object({
                        max = optional(number)
                        min = optional(number)
                    })))
                    total_local_storage_gb                           = optional(list(object({
                        max = optional(number)
                        min = optional(number)
                    })))
                    vcpu_count                                       = optional(list(object({
                        max = optional(number)
                        min = optional(number)
                    })))
                })))
            })))
        })))
    spot_maintenance_strategies         = optional(list(object({
            capacity_rebalance = optional(list(object({
                replacement_strategy = optional(string)
            })))
        })))
  }))
}
