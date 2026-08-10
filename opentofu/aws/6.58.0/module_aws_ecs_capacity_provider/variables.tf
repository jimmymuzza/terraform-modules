variable "ecs_capacity_providers" {
  description = <<EOT
Map of ecs_capacity_providers, attributes below
Required:
    - name
Optional:
    - cluster
    - region
    - tags
    - tags_all
    - auto_scaling_group_provider
    - managed_instances_provider
EOT

  type = map(object({
    name                        = string
    cluster                     = optional(string)
    region                      = optional(string)
    tags                        = optional(map(string))
    tags_all                    = optional(map(string))
    auto_scaling_group_provider = optional(list(object({
            auto_scaling_group_arn         = string
            managed_draining               = optional(string)
            managed_termination_protection = optional(string)
            managed_scaling                = optional(list(object({
                instance_warmup_period    = optional(number)
                maximum_scaling_step_size = optional(number)
                minimum_scaling_step_size = optional(number)
                status                    = optional(string)
                target_capacity           = optional(number)
            })))
        })))
    managed_instances_provider  = optional(list(object({
            infrastructure_role_arn     = string
            propagate_tags              = optional(string)
            infrastructure_optimization = optional(list(object({
                scale_in_after = optional(number)
            })))
            instance_launch_template    = list(object({
                ec2_instance_profile_arn    = string
                capacity_option_type        = optional(string)
                monitoring                  = optional(string)
                capacity_reservations       = optional(list(object({
                    reservation_group_arn  = optional(string)
                    reservation_preference = optional(string)
                })))
                instance_requirements       = optional(list(object({
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
                local_storage_configuration = optional(list(object({
                    use_local_storage = optional(bool)
                })))
                network_configuration       = list(object({
                    subnets         = set(string)
                    security_groups = optional(set(string))
                }))
                storage_configuration       = optional(list(object({
                    storage_size_gib = number
                })))
            }))
        })))
  }))
}
