variable "ecs_services" {
  description = <<EOT
Map of ecs_services, attributes below
Required:
    - name
Optional:
    - availability_zone_rebalancing
    - cluster
    - deployment_maximum_percent
    - deployment_minimum_healthy_percent
    - desired_count
    - enable_ecs_managed_tags
    - enable_execute_command
    - force_delete
    - force_new_deployment
    - health_check_grace_period_seconds
    - iam_role
    - launch_type
    - platform_version
    - propagate_tags
    - region
    - scheduling_strategy
    - sigint_rollback
    - tags
    - tags_all
    - task_definition
    - triggers
    - wait_for_steady_state
    - alarms
    - capacity_provider_strategy
    - deployment_circuit_breaker
    - deployment_configuration
    - deployment_controller
    - load_balancer
    - network_configuration
    - ordered_placement_strategy
    - placement_constraints
    - service_connect_configuration
    - service_registries
    - volume_configuration
    - vpc_lattice_configurations
EOT

  type = map(object({
    name                               = string
    availability_zone_rebalancing      = optional(string)
    cluster                            = optional(string)
    deployment_maximum_percent         = optional(number)
    deployment_minimum_healthy_percent = optional(number)
    desired_count                      = optional(number)
    enable_ecs_managed_tags            = optional(bool)
    enable_execute_command             = optional(bool)
    force_delete                       = optional(bool)
    force_new_deployment               = optional(bool)
    health_check_grace_period_seconds  = optional(number)
    iam_role                           = optional(string)
    launch_type                        = optional(string)
    platform_version                   = optional(string)
    propagate_tags                     = optional(string)
    region                             = optional(string)
    scheduling_strategy                = optional(string)
    sigint_rollback                    = optional(bool)
    tags                               = optional(map(string))
    tags_all                           = optional(map(string))
    task_definition                    = optional(string)
    triggers                           = optional(map(string))
    wait_for_steady_state              = optional(bool)
    alarms                             = optional(list(object({
            alarm_names = set(string)
            enable      = bool
            rollback    = bool
        })))
    capacity_provider_strategy         = optional(set(object({
            capacity_provider = string
            base              = optional(number)
            weight            = optional(number)
        })))
    deployment_circuit_breaker         = optional(list(object({
            enable   = bool
            rollback = bool
        })))
    deployment_configuration           = optional(list(object({
            bake_time_in_minutes = optional(string)
            strategy             = optional(string)
            canary_configuration = optional(list(object({
                canary_bake_time_in_minutes = optional(string)
                canary_percent              = optional(number)
            })))
            lifecycle_hook       = optional(set(object({
                hook_target_arn  = string
                lifecycle_stages = list(string)
                role_arn         = string
                hook_details     = optional(string)
            })))
            linear_configuration = optional(list(object({
                step_bake_time_in_minutes = optional(string)
                step_percent              = optional(number)
            })))
        })))
    deployment_controller              = optional(list(object({
            type = optional(string)
        })))
    load_balancer                      = optional(set(object({
            container_name         = string
            container_port         = number
            elb_name               = optional(string)
            target_group_arn       = optional(string)
            advanced_configuration = optional(list(object({
                alternate_target_group_arn = string
                production_listener_rule   = string
                role_arn                   = string
                test_listener_rule         = optional(string)
            })))
        })))
    network_configuration              = optional(list(object({
            subnets          = set(string)
            assign_public_ip = optional(bool)
            security_groups  = optional(set(string))
        })))
    ordered_placement_strategy         = optional(list(object({
            type  = string
            field = optional(string)
        })))
    placement_constraints              = optional(set(object({
            type       = string
            expression = optional(string)
        })))
    service_connect_configuration      = optional(list(object({
            enabled           = bool
            namespace         = optional(string)
            log_configuration = optional(list(object({
                log_driver    = string
                options       = optional(map(string))
                secret_option = optional(list(object({
                    name       = string
                    value_from = string
                })))
            })))
            service           = optional(list(object({
                port_name             = string
                discovery_name        = optional(string)
                ingress_port_override = optional(number)
                client_alias          = optional(list(object({
                    port               = number
                    dns_name           = optional(string)
                    test_traffic_rules = optional(list(object({
                        header = optional(list(object({
                            name  = string
                            value = list(object({
                                exact = string
                            }))
                        })))
                    })))
                })))
                timeout               = optional(list(object({
                    idle_timeout_seconds        = optional(number)
                    per_request_timeout_seconds = optional(number)
                })))
                tls                   = optional(list(object({
                    kms_key               = optional(string)
                    role_arn              = optional(string)
                    issuer_cert_authority = list(object({
                        aws_pca_authority_arn = string
                    }))
                })))
            })))
        })))
    service_registries                 = optional(list(object({
            registry_arn   = string
            container_name = optional(string)
            container_port = optional(number)
            port           = optional(number)
        })))
    volume_configuration               = optional(list(object({
            name               = string
            managed_ebs_volume = list(object({
                role_arn                   = string
                encrypted                  = optional(bool)
                file_system_type           = optional(string)
                iops                       = optional(number)
                kms_key_id                 = optional(string)
                size_in_gb                 = optional(number)
                snapshot_id                = optional(string)
                throughput                 = optional(number)
                volume_initialization_rate = optional(number)
                volume_type                = optional(string)
                tag_specifications         = optional(list(object({
                    resource_type  = string
                    propagate_tags = optional(string)
                    tags           = optional(map(string))
                })))
            }))
        })))
    vpc_lattice_configurations         = optional(set(object({
            port_name        = string
            role_arn         = string
            target_group_arn = string
        })))
  }))
}
