variable "arcregionswitch_plans" {
  description = <<EOT
Map of arcregionswitch_plans, attributes below
Required:
    - execution_role
    - name
    - recovery_approach
    - regions
Optional:
    - description
    - primary_region
    - recovery_time_objective_minutes
    - region
    - tags
    - associated_alarms
    - report_configuration
    - triggers
    - workflow
EOT

  type = map(object({
    execution_role                  = string
    name                            = string
    recovery_approach               = string
    regions                         = list(string)
    description                     = optional(string)
    primary_region                  = optional(string)
    recovery_time_objective_minutes = optional(number)
    region                          = optional(string)
    tags                            = optional(map(string))
    associated_alarms               = optional(set(object({
            alarm_type          = string
            map_block_key       = string
            resource_identifier = string
            cross_account_role  = optional(string)
            external_id         = optional(string)
        })))
    report_configuration            = optional(list(object({
            report_output = optional(list(object({
                s3_configuration = optional(list(object({
                    bucket_owner = string
                    bucket_path  = string
                })))
            })))
        })))
    triggers                        = optional(list(object({
            action                               = string
            min_delay_minutes_between_executions = number
            target_region                        = string
            description                          = optional(string)
            conditions                           = optional(list(object({
                associated_alarm_name = string
                condition             = string
            })))
        })))
    workflow                        = optional(list(object({
            workflow_target_action = string
            workflow_description   = optional(string)
            workflow_target_region = optional(string)
            step                   = optional(list(object({
                execution_block_type                        = string
                name                                        = string
                description                                 = optional(string)
                arc_routing_control_config                  = optional(list(object({
                    cross_account_role          = optional(string)
                    external_id                 = optional(string)
                    timeout_minutes             = optional(number)
                    region_and_routing_controls = optional(set(object({
                        region          = string
                        routing_control = optional(list(object({
                            routing_control_arn = string
                            state               = string
                        })))
                    })))
                })))
                custom_action_lambda_config                 = optional(list(object({
                    region_to_run          = string
                    retry_interval_minutes = number
                    timeout_minutes        = optional(number)
                    lambda                 = optional(list(object({
                        arn                = string
                        cross_account_role = optional(string)
                        external_id        = optional(string)
                    })))
                    ungraceful             = optional(list(object({
                        behavior = string
                    })))
                })))
                document_db_config                          = optional(list(object({
                    behavior                  = string
                    database_cluster_arns     = list(string)
                    global_cluster_identifier = string
                    cross_account_role        = optional(string)
                    external_id               = optional(string)
                    timeout_minutes           = optional(number)
                    ungraceful                = optional(list(object({
                        ungraceful = string
                    })))
                })))
                ec2_asg_capacity_increase_config            = optional(list(object({
                    capacity_monitoring_approach = string
                    target_percent               = optional(number)
                    timeout_minutes              = optional(number)
                    asg                          = optional(list(object({
                        arn                = string
                        cross_account_role = optional(string)
                        external_id        = optional(string)
                    })))
                    ungraceful                   = optional(list(object({
                        minimum_success_percentage = number
                    })))
                })))
                ecs_capacity_increase_config                = optional(list(object({
                    capacity_monitoring_approach = string
                    target_percent               = optional(number)
                    timeout_minutes              = optional(number)
                    service                      = optional(list(object({
                        cluster_arn        = string
                        service_arn        = string
                        cross_account_role = optional(string)
                        external_id        = optional(string)
                    })))
                    ungraceful                   = optional(list(object({
                        minimum_success_percentage = number
                    })))
                })))
                eks_resource_scaling_config                 = optional(list(object({
                    capacity_monitoring_approach = string
                    target_percent               = number
                    timeout_minutes              = optional(number)
                    eks_clusters                 = optional(list(object({
                        cluster_arn        = string
                        cross_account_role = optional(string)
                        external_id        = optional(string)
                    })))
                    kubernetes_resource_type     = optional(list(object({
                        api_version = string
                        kind        = string
                    })))
                    scaling_resources            = optional(list(object({
                        namespace = string
                        resources = optional(set(object({
                            name          = string
                            namespace     = string
                            resource_name = string
                            hpa_name      = optional(string)
                        })))
                    })))
                    ungraceful                   = optional(list(object({
                        minimum_success_percentage = number
                    })))
                })))
                execution_approval_config                   = optional(list(object({
                    approval_role   = string
                    timeout_minutes = optional(number)
                })))
                global_aurora_config                        = optional(list(object({
                    behavior                  = string
                    database_cluster_arns     = list(string)
                    global_cluster_identifier = string
                    cross_account_role        = optional(string)
                    external_id               = optional(string)
                    timeout_minutes           = optional(number)
                    ungraceful                = optional(list(object({
                        ungraceful = string
                    })))
                })))
                parallel_config                             = optional(list(object({
                    step = optional(list(object({
                        execution_block_type                        = string
                        name                                        = string
                        description                                 = optional(string)
                        arc_routing_control_config                  = optional(list(object({
                            cross_account_role          = optional(string)
                            external_id                 = optional(string)
                            timeout_minutes             = optional(number)
                            region_and_routing_controls = optional(set(object({
                                region          = string
                                routing_control = optional(list(object({
                                    routing_control_arn = string
                                    state               = string
                                })))
                            })))
                        })))
                        custom_action_lambda_config                 = optional(list(object({
                            region_to_run          = string
                            retry_interval_minutes = number
                            timeout_minutes        = optional(number)
                            lambda                 = optional(list(object({
                                arn                = string
                                cross_account_role = optional(string)
                                external_id        = optional(string)
                            })))
                            ungraceful             = optional(list(object({
                                behavior = string
                            })))
                        })))
                        document_db_config                          = optional(list(object({
                            behavior                  = string
                            database_cluster_arns     = list(string)
                            global_cluster_identifier = string
                            cross_account_role        = optional(string)
                            external_id               = optional(string)
                            timeout_minutes           = optional(number)
                            ungraceful                = optional(list(object({
                                ungraceful = string
                            })))
                        })))
                        ec2_asg_capacity_increase_config            = optional(list(object({
                            capacity_monitoring_approach = string
                            target_percent               = optional(number)
                            timeout_minutes              = optional(number)
                            asg                          = optional(list(object({
                                arn                = string
                                cross_account_role = optional(string)
                                external_id        = optional(string)
                            })))
                            ungraceful                   = optional(list(object({
                                minimum_success_percentage = number
                            })))
                        })))
                        ecs_capacity_increase_config                = optional(list(object({
                            capacity_monitoring_approach = string
                            target_percent               = optional(number)
                            timeout_minutes              = optional(number)
                            service                      = optional(list(object({
                                cluster_arn        = string
                                service_arn        = string
                                cross_account_role = optional(string)
                                external_id        = optional(string)
                            })))
                            ungraceful                   = optional(list(object({
                                minimum_success_percentage = number
                            })))
                        })))
                        eks_resource_scaling_config                 = optional(list(object({
                            capacity_monitoring_approach = string
                            target_percent               = number
                            timeout_minutes              = optional(number)
                            eks_clusters                 = optional(list(object({
                                cluster_arn        = string
                                cross_account_role = optional(string)
                                external_id        = optional(string)
                            })))
                            kubernetes_resource_type     = optional(list(object({
                                api_version = string
                                kind        = string
                            })))
                            scaling_resources            = optional(list(object({
                                namespace = string
                                resources = optional(set(object({
                                    name          = string
                                    namespace     = string
                                    resource_name = string
                                    hpa_name      = optional(string)
                                })))
                            })))
                            ungraceful                   = optional(list(object({
                                minimum_success_percentage = number
                            })))
                        })))
                        execution_approval_config                   = optional(list(object({
                            approval_role   = string
                            timeout_minutes = optional(number)
                        })))
                        global_aurora_config                        = optional(list(object({
                            behavior                  = string
                            database_cluster_arns     = list(string)
                            global_cluster_identifier = string
                            cross_account_role        = optional(string)
                            external_id               = optional(string)
                            timeout_minutes           = optional(number)
                            ungraceful                = optional(list(object({
                                ungraceful = string
                            })))
                        })))
                        rds_create_cross_region_read_replica_config = optional(list(object({
                            db_instance_arn_map = map(string)
                            cross_account_role  = optional(string)
                            external_id         = optional(string)
                            timeout_minutes     = optional(number)
                        })))
                        rds_promote_read_replica_config             = optional(list(object({
                            db_instance_arn_map = map(string)
                            cross_account_role  = optional(string)
                            external_id         = optional(string)
                            timeout_minutes     = optional(number)
                        })))
                        region_switch_plan_config                   = optional(list(object({
                            arn                = string
                            cross_account_role = optional(string)
                            external_id        = optional(string)
                        })))
                        route53_health_check_config                 = optional(list(object({
                            hosted_zone_id     = string
                            record_name        = string
                            cross_account_role = optional(string)
                            external_id        = optional(string)
                            timeout_minutes    = optional(number)
                            record_set         = optional(list(object({
                                record_set_identifier = string
                                region                = string
                            })))
                        })))
                    })))
                })))
                rds_create_cross_region_read_replica_config = optional(list(object({
                    db_instance_arn_map = map(string)
                    cross_account_role  = optional(string)
                    external_id         = optional(string)
                    timeout_minutes     = optional(number)
                })))
                rds_promote_read_replica_config             = optional(list(object({
                    db_instance_arn_map = map(string)
                    cross_account_role  = optional(string)
                    external_id         = optional(string)
                    timeout_minutes     = optional(number)
                })))
                region_switch_plan_config                   = optional(list(object({
                    arn                = string
                    cross_account_role = optional(string)
                    external_id        = optional(string)
                })))
                route53_health_check_config                 = optional(list(object({
                    hosted_zone_id     = string
                    record_name        = string
                    cross_account_role = optional(string)
                    external_id        = optional(string)
                    timeout_minutes    = optional(number)
                    record_set         = optional(list(object({
                        record_set_identifier = string
                        region                = string
                    })))
                })))
            })))
        })))
  }))
}
