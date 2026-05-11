variable "autoscaling_groups" {
  description = <<EOT
Map of autoscaling_groups, attributes below
Required:
    - max_size
    - min_size
Optional:
    - availability_zones
    - capacity_rebalance
    - context
    - default_cooldown
    - default_instance_warmup
    - desired_capacity
    - desired_capacity_type
    - enabled_metrics
    - force_delete
    - force_delete_warm_pool
    - health_check_grace_period
    - health_check_type
    - ignore_failed_scaling_activities
    - launch_configuration
    - load_balancers
    - max_instance_lifetime
    - metrics_granularity
    - min_elb_capacity
    - name
    - name_prefix
    - placement_group
    - protect_from_scale_in
    - region
    - service_linked_role_arn
    - suspended_processes
    - target_group_arns
    - termination_policies
    - vpc_zone_identifier
    - wait_for_capacity_timeout
    - wait_for_elb_capacity
    - availability_zone_distribution
    - capacity_reservation_specification
    - initial_lifecycle_hook
    - instance_maintenance_policy
    - instance_refresh
    - launch_template
    - mixed_instances_policy
    - tag
    - traffic_source
    - warm_pool
EOT

  type = map(object({
    max_size                           = number
    min_size                           = number
    availability_zones                 = optional(set(string))
    capacity_rebalance                 = optional(bool)
    context                            = optional(string)
    default_cooldown                   = optional(number)
    default_instance_warmup            = optional(number)
    desired_capacity                   = optional(number)
    desired_capacity_type              = optional(string)
    enabled_metrics                    = optional(set(string))
    force_delete                       = optional(bool)
    force_delete_warm_pool             = optional(bool)
    health_check_grace_period          = optional(number)
    health_check_type                  = optional(string)
    ignore_failed_scaling_activities   = optional(bool)
    launch_configuration               = optional(string)
    load_balancers                     = optional(set(string))
    max_instance_lifetime              = optional(number)
    metrics_granularity                = optional(string)
    min_elb_capacity                   = optional(number)
    name                               = optional(string)
    name_prefix                        = optional(string)
    placement_group                    = optional(string)
    protect_from_scale_in              = optional(bool)
    region                             = optional(string)
    service_linked_role_arn            = optional(string)
    suspended_processes                = optional(set(string))
    target_group_arns                  = optional(set(string))
    termination_policies               = optional(list(string))
    vpc_zone_identifier                = optional(set(string))
    wait_for_capacity_timeout          = optional(string)
    wait_for_elb_capacity              = optional(number)
    availability_zone_distribution     = optional(list(object({
            capacity_distribution_strategy = optional(string)
        })))
    capacity_reservation_specification = optional(list(object({
            capacity_reservation_preference = optional(string)
            capacity_reservation_target     = optional(list(object({
                capacity_reservation_ids                 = optional(list(string))
                capacity_reservation_resource_group_arns = optional(list(string))
            })))
        })))
    initial_lifecycle_hook             = optional(set(object({
            lifecycle_transition    = string
            name                    = string
            default_result          = optional(string)
            heartbeat_timeout       = optional(number)
            notification_metadata   = optional(string)
            notification_target_arn = optional(string)
            role_arn                = optional(string)
        })))
    instance_maintenance_policy        = optional(list(object({
            max_healthy_percentage = number
            min_healthy_percentage = number
        })))
    instance_refresh                   = optional(list(object({
            strategy    = string
            triggers    = optional(set(string))
            preferences = optional(list(object({
                auto_rollback                = optional(bool)
                checkpoint_delay             = optional(string)
                checkpoint_percentages       = optional(list(number))
                instance_warmup              = optional(string)
                max_healthy_percentage       = optional(number)
                min_healthy_percentage       = optional(number)
                scale_in_protected_instances = optional(string)
                skip_matching                = optional(bool)
                standby_instances            = optional(string)
                alarm_specification          = optional(list(object({
                    alarms = optional(list(string))
                })))
            })))
        })))
    launch_template                    = optional(list(object({
            name    = optional(string)
            version = optional(string)
        })))
    mixed_instances_policy             = optional(list(object({
            instances_distribution = optional(list(object({
                on_demand_allocation_strategy            = optional(string)
                on_demand_base_capacity                  = optional(number)
                on_demand_percentage_above_base_capacity = optional(number)
                spot_allocation_strategy                 = optional(string)
                spot_instance_pools                      = optional(number)
                spot_max_price                           = optional(string)
            })))
            launch_template        = list(object({
                launch_template_specification = list(object({
                    launch_template_id   = optional(string)
                    launch_template_name = optional(string)
                    version              = optional(string)
                }))
                override                      = optional(list(object({
                    instance_type                 = optional(string)
                    weighted_capacity             = optional(string)
                    instance_requirements         = optional(list(object({
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
                        memory_mib                                              = optional(list(object({
                            max = optional(number)
                            min = optional(number)
                        })))
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
                        vcpu_count                                              = optional(list(object({
                            max = optional(number)
                            min = optional(number)
                        })))
                    })))
                    launch_template_specification = optional(list(object({
                        launch_template_id   = optional(string)
                        launch_template_name = optional(string)
                        version              = optional(string)
                    })))
                })))
            }))
        })))
    tag                                = optional(set(object({
            key                 = string
            propagate_at_launch = bool
            value               = string
        })))
    traffic_source                     = optional(set(object({
            identifier = string
            type       = optional(string)
        })))
    warm_pool                          = optional(list(object({
            max_group_prepared_capacity = optional(number)
            min_size                    = optional(number)
            pool_state                  = optional(string)
            instance_reuse_policy       = optional(list(object({
                reuse_on_scale_in = optional(bool)
            })))
        })))
  }))
}
