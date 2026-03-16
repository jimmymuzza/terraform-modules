variable "codedeploy_deployment_groups" {
  description = <<EOT
Map of codedeploy_deployment_groups, attributes below
Required:
    - app_name
    - deployment_group_name
    - service_role_arn
Optional:
    - autoscaling_groups
    - deployment_config_name
    - outdated_instances_strategy
    - region
    - tags
    - tags_all
    - termination_hook_enabled
    - alarm_configuration
    - auto_rollback_configuration
    - blue_green_deployment_config
    - deployment_style
    - ec2_tag_filter
    - ec2_tag_set
    - ecs_service
    - load_balancer_info
    - on_premises_instance_tag_filter
    - trigger_configuration
EOT

  type = map(object({
    app_name                        = string
    deployment_group_name           = string
    service_role_arn                = string
    autoscaling_groups              = optional(set(string))
    deployment_config_name          = optional(string)
    outdated_instances_strategy     = optional(string)
    region                          = optional(string)
    tags                            = optional(map(string))
    tags_all                        = optional(map(string))
    termination_hook_enabled        = optional(bool)
    alarm_configuration             = optional(list(object({
            alarms                    = optional(set(string))
            enabled                   = optional(bool)
            ignore_poll_alarm_failure = optional(bool)
        })))
    auto_rollback_configuration     = optional(list(object({
            enabled = optional(bool)
            events  = optional(set(string))
        })))
    blue_green_deployment_config    = optional(list(object({
            deployment_ready_option                        = optional(list(object({
                action_on_timeout    = optional(string)
                wait_time_in_minutes = optional(number)
            })))
            green_fleet_provisioning_option                = optional(list(object({
                action = optional(string)
            })))
            terminate_blue_instances_on_deployment_success = optional(list(object({
                action                           = optional(string)
                termination_wait_time_in_minutes = optional(number)
            })))
        })))
    deployment_style                = optional(list(object({
            deployment_option = optional(string)
            deployment_type   = optional(string)
        })))
    ec2_tag_filter                  = optional(set(object({
            key   = optional(string)
            type  = optional(string)
            value = optional(string)
        })))
    ec2_tag_set                     = optional(set(object({
            ec2_tag_filter = optional(set(object({
                key   = optional(string)
                type  = optional(string)
                value = optional(string)
            })))
        })))
    ecs_service                     = optional(list(object({
            cluster_name = string
            service_name = string
        })))
    load_balancer_info              = optional(list(object({
            elb_info               = optional(set(object({
                name = optional(string)
            })))
            target_group_info      = optional(set(object({
                name = optional(string)
            })))
            target_group_pair_info = optional(list(object({
                prod_traffic_route = list(object({
                    listener_arns = set(string)
                }))
                target_group       = list(object({
                    name = string
                }))
                test_traffic_route = optional(list(object({
                    listener_arns = set(string)
                })))
            })))
        })))
    on_premises_instance_tag_filter = optional(set(object({
            key   = optional(string)
            type  = optional(string)
            value = optional(string)
        })))
    trigger_configuration           = optional(set(object({
            trigger_events     = set(string)
            trigger_name       = string
            trigger_target_arn = string
        })))
  }))
}
