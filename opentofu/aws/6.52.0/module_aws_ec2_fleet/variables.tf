variable "ec2_fleets" {
  description = <<EOT
Map of ec2_fleets, attributes below
Required:
    - launch_template_config
    - target_capacity_specification
Optional:
    - context
    - excess_capacity_termination_policy
    - fleet_state
    - fulfilled_capacity
    - fulfilled_on_demand_capacity
    - region
    - replace_unhealthy_instances
    - tags
    - tags_all
    - terminate_instances
    - terminate_instances_with_expiration
    - type
    - valid_from
    - valid_until
    - fleet_instance_set
    - on_demand_options
    - spot_options
EOT

  type = map(object({
    context                             = optional(string)
    excess_capacity_termination_policy  = optional(string)
    fleet_state                         = optional(string)
    fulfilled_capacity                  = optional(number)
    fulfilled_on_demand_capacity        = optional(number)
    region                              = optional(string)
    replace_unhealthy_instances         = optional(bool)
    tags                                = optional(map(string))
    tags_all                            = optional(map(string))
    terminate_instances                 = optional(bool)
    terminate_instances_with_expiration = optional(bool)
    type                                = optional(string)
    valid_from                          = optional(string)
    valid_until                         = optional(string)
    fleet_instance_set                  = optional(list(object({
            instance_ids  = optional(list(string))
            instance_type = optional(string)
            lifecycle     = optional(string)
            platform      = optional(string)
        })))
    launch_template_config              = list(object({
            launch_template_specification = optional(list(object({
                version              = string
                launch_template_id   = optional(string)
                launch_template_name = optional(string)
            })))
            override                      = optional(list(object({
                availability_zone     = optional(string)
                instance_type         = optional(string)
                max_price             = optional(string)
                priority              = optional(number)
                subnet_id             = optional(string)
                weighted_capacity     = optional(number)
                instance_requirements = optional(list(object({
                    accelerator_manufacturers                               = optional(set(string))
                    accelerator_names                                       = optional(set(string))
                    accelerator_types                                       = optional(set(string))
                    allowed_instance_types                                  = optional(set(string))
                    bare_metal                                              = optional(string)
                    burstable_performance                                   = optional(string)
                    cpu_manufacturers                                       = optional(set(string))
                    excluded_instance_types                                 = optional(set(string))
                    instance_generations                                    = optional(set(string))
                    local_storage                                           = optional(string)
                    local_storage_types                                     = optional(set(string))
                    max_spot_price_as_percentage_of_optimal_on_demand_price = optional(number)
                    on_demand_max_price_percentage_over_lowest_price        = optional(number)
                    require_hibernate_support                               = optional(bool)
                    spot_max_price_percentage_over_lowest_price             = optional(number)
                    accelerator_count                                       = optional(list(object({
                        max = optional(number)
                        min = optional(number)
                    })))
                    accelerator_total_memory_mib                            = optional(list(object({
                        max = optional(number)
                        min = optional(number)
                    })))
                    baseline_ebs_bandwidth_mbps                             = optional(list(object({
                        max = optional(number)
                        min = optional(number)
                    })))
                    memory_gib_per_vcpu                                     = optional(list(object({
                        max = optional(number)
                        min = optional(number)
                    })))
                    memory_mib                                              = list(object({
                        min = number
                        max = optional(number)
                    }))
                    network_bandwidth_gbps                                  = optional(list(object({
                        max = optional(number)
                        min = optional(number)
                    })))
                    network_interface_count                                 = optional(list(object({
                        max = optional(number)
                        min = optional(number)
                    })))
                    total_local_storage_gb                                  = optional(list(object({
                        max = optional(number)
                        min = optional(number)
                    })))
                    vcpu_count                                              = list(object({
                        min = number
                        max = optional(number)
                    }))
                })))
            })))
        }))
    on_demand_options                   = optional(list(object({
            allocation_strategy          = optional(string)
            max_total_price              = optional(string)
            min_target_capacity          = optional(number)
            single_availability_zone     = optional(bool)
            single_instance_type         = optional(bool)
            capacity_reservation_options = optional(list(object({
                usage_strategy = optional(string)
            })))
        })))
    spot_options                        = optional(list(object({
            allocation_strategy            = optional(string)
            instance_interruption_behavior = optional(string)
            instance_pools_to_use_count    = optional(number)
            max_total_price                = optional(string)
            min_target_capacity            = optional(number)
            single_availability_zone       = optional(bool)
            single_instance_type           = optional(bool)
            maintenance_strategies         = optional(list(object({
                capacity_rebalance = optional(list(object({
                    replacement_strategy = optional(string)
                    termination_delay    = optional(number)
                })))
            })))
        })))
    target_capacity_specification       = list(object({
            default_target_capacity_type = string
            total_target_capacity        = number
            on_demand_target_capacity    = optional(number)
            spot_target_capacity         = optional(number)
            target_capacity_unit_type    = optional(string)
        }))
  }))
}
