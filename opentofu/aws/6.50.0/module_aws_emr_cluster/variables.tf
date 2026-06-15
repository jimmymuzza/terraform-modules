variable "emr_clusters" {
  description = <<EOT
Map of emr_clusters, attributes below
Required:
    - name
    - release_label
    - service_role
Optional:
    - additional_info
    - applications
    - autoscaling_role
    - configurations
    - configurations_json
    - custom_ami_id
    - ebs_root_volume_size
    - keep_job_flow_alive_when_no_steps
    - list_steps_states
    - log_encryption_kms_key_id
    - log_uri
    - os_release_label
    - placement_group_config
    - region
    - scale_down_behavior
    - security_configuration
    - step
    - step_concurrency_level
    - tags
    - tags_all
    - termination_protection
    - unhealthy_node_replacement
    - visible_to_all_users
    - auto_termination_policy
    - bootstrap_action
    - core_instance_fleet
    - core_instance_group
    - ec2_attributes
    - kerberos_attributes
    - master_instance_fleet
    - master_instance_group
EOT

  type = map(object({
    name                              = string
    release_label                     = string
    service_role                      = string
    additional_info                   = optional(string)
    applications                      = optional(set(string))
    autoscaling_role                  = optional(string)
    configurations                    = optional(string)
    configurations_json               = optional(string)
    custom_ami_id                     = optional(string)
    ebs_root_volume_size              = optional(number)
    keep_job_flow_alive_when_no_steps = optional(bool)
    list_steps_states                 = optional(set(string))
    log_encryption_kms_key_id         = optional(string)
    log_uri                           = optional(string)
    os_release_label                  = optional(string)
    placement_group_config            = optional(list(object({
            instance_role = string
            placement_strategy = string
        })))
    region                            = optional(string)
    scale_down_behavior               = optional(string)
    security_configuration            = optional(string)
    step                              = optional(list(object({
            action_on_failure = string
            hadoop_jar_step = list(object({
                args = list(string)
                jar = string
                main_class = string
                properties = map(string)
            }))
            name = string
        })))
    step_concurrency_level            = optional(number)
    tags                              = optional(map(string))
    tags_all                          = optional(map(string))
    termination_protection            = optional(bool)
    unhealthy_node_replacement        = optional(bool)
    visible_to_all_users              = optional(bool)
    auto_termination_policy           = optional(list(object({
            idle_timeout = optional(number)
        })))
    bootstrap_action                  = optional(list(object({
            name = string
            path = string
            args = optional(list(string))
        })))
    core_instance_fleet               = optional(list(object({
            name                      = optional(string)
            target_on_demand_capacity = optional(number)
            target_spot_capacity      = optional(number)
            instance_type_configs     = optional(set(object({
                instance_type                              = string
                bid_price                                  = optional(string)
                bid_price_as_percentage_of_on_demand_price = optional(number)
                weighted_capacity                          = optional(number)
                configurations                             = optional(set(object({
                    classification = optional(string)
                    properties     = optional(map(string))
                })))
                ebs_config                                 = optional(set(object({
                    size                 = number
                    type                 = string
                    iops                 = optional(number)
                    volumes_per_instance = optional(number)
                })))
            })))
            launch_specifications     = optional(list(object({
                on_demand_specification = optional(list(object({
                    allocation_strategy = string
                })))
                spot_specification      = optional(list(object({
                    allocation_strategy      = string
                    timeout_action           = string
                    timeout_duration_minutes = number
                    block_duration_minutes   = optional(number)
                })))
            })))
        })))
    core_instance_group               = optional(list(object({
            instance_type      = string
            autoscaling_policy = optional(string)
            bid_price          = optional(string)
            instance_count     = optional(number)
            name               = optional(string)
            ebs_config         = optional(set(object({
                size                 = number
                type                 = string
                iops                 = optional(number)
                throughput           = optional(number)
                volumes_per_instance = optional(number)
            })))
        })))
    ec2_attributes                    = optional(list(object({
            instance_profile                  = string
            additional_master_security_groups = optional(string)
            additional_slave_security_groups  = optional(string)
            emr_managed_master_security_group = optional(string)
            emr_managed_slave_security_group  = optional(string)
            key_name                          = optional(string)
            service_access_security_group     = optional(string)
            subnet_id                         = optional(string)
            subnet_ids                        = optional(set(string))
        })))
    kerberos_attributes               = optional(list(object({
            kdc_admin_password                   = string
            realm                                = string
            ad_domain_join_password              = optional(string)
            ad_domain_join_user                  = optional(string)
            cross_realm_trust_principal_password = optional(string)
        })))
    master_instance_fleet             = optional(list(object({
            name                      = optional(string)
            target_on_demand_capacity = optional(number)
            target_spot_capacity      = optional(number)
            instance_type_configs     = optional(set(object({
                instance_type                              = string
                bid_price                                  = optional(string)
                bid_price_as_percentage_of_on_demand_price = optional(number)
                weighted_capacity                          = optional(number)
                configurations                             = optional(set(object({
                    classification = optional(string)
                    properties     = optional(map(string))
                })))
                ebs_config                                 = optional(set(object({
                    size                 = number
                    type                 = string
                    iops                 = optional(number)
                    volumes_per_instance = optional(number)
                })))
            })))
            launch_specifications     = optional(list(object({
                on_demand_specification = optional(list(object({
                    allocation_strategy = string
                })))
                spot_specification      = optional(list(object({
                    allocation_strategy      = string
                    timeout_action           = string
                    timeout_duration_minutes = number
                    block_duration_minutes   = optional(number)
                })))
            })))
        })))
    master_instance_group             = optional(list(object({
            instance_type  = string
            bid_price      = optional(string)
            instance_count = optional(number)
            name           = optional(string)
            ebs_config     = optional(set(object({
                size                 = number
                type                 = string
                iops                 = optional(number)
                throughput           = optional(number)
                volumes_per_instance = optional(number)
            })))
        })))
  }))
}
