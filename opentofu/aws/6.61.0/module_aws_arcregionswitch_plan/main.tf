resource "aws_arcregionswitch_plan" "arcregionswitch_plans" {
  for_each = var.arcregionswitch_plans

  execution_role                  = each.value.execution_role
  name                            = each.value.name
  recovery_approach               = each.value.recovery_approach
  regions                         = each.value.regions
  description                     = each.value.description
  primary_region                  = each.value.primary_region
  recovery_time_objective_minutes = each.value.recovery_time_objective_minutes
  region                          = each.value.region
  tags                            = each.value.tags

  dynamic "associated_alarms" {
    for_each = each.value.associated_alarms != null ? each.value.associated_alarms : []
    content {
      alarm_type          = associated_alarms.value.alarm_type
      map_block_key       = associated_alarms.value.map_block_key
      resource_identifier = associated_alarms.value.resource_identifier
      cross_account_role  = associated_alarms.value.cross_account_role
      external_id         = associated_alarms.value.external_id
    }
  }

  dynamic "report_configuration" {
    for_each = each.value.report_configuration != null ? each.value.report_configuration : []
    content {

      dynamic "report_output" {
        for_each = report_configuration.value.report_output != null ? report_configuration.value.report_output : []
        content {

          dynamic "s3_configuration" {
            for_each = report_output.value.s3_configuration != null ? report_output.value.s3_configuration : []
            content {
              bucket_owner = s3_configuration.value.bucket_owner
              bucket_path  = s3_configuration.value.bucket_path
            }
          }
        }
      }
    }
  }

  dynamic "triggers" {
    for_each = each.value.triggers != null ? each.value.triggers : []
    content {
      action                               = triggers.value.action
      min_delay_minutes_between_executions = triggers.value.min_delay_minutes_between_executions
      target_region                        = triggers.value.target_region
      description                          = triggers.value.description

      dynamic "conditions" {
        for_each = triggers.value.conditions != null ? triggers.value.conditions : []
        content {
          associated_alarm_name = conditions.value.associated_alarm_name
          condition             = conditions.value.condition
        }
      }
    }
  }

  dynamic "workflow" {
    for_each = each.value.workflow != null ? each.value.workflow : []
    content {
      workflow_target_action = workflow.value.workflow_target_action
      workflow_description   = workflow.value.workflow_description
      workflow_target_region = workflow.value.workflow_target_region

      dynamic "step" {
        for_each = workflow.value.step != null ? workflow.value.step : []
        content {
          execution_block_type = step.value.execution_block_type
          name                 = step.value.name
          description          = step.value.description

          dynamic "arc_routing_control_config" {
            for_each = step.value.arc_routing_control_config != null ? step.value.arc_routing_control_config : []
            content {
              cross_account_role = arc_routing_control_config.value.cross_account_role
              external_id        = arc_routing_control_config.value.external_id
              timeout_minutes    = arc_routing_control_config.value.timeout_minutes

              dynamic "region_and_routing_controls" {
                for_each = arc_routing_control_config.value.region_and_routing_controls != null ? arc_routing_control_config.value.region_and_routing_controls : []
                content {
                  region = region_and_routing_controls.value.region

                  dynamic "routing_control" {
                    for_each = region_and_routing_controls.value.routing_control != null ? region_and_routing_controls.value.routing_control : []
                    content {
                      routing_control_arn = routing_control.value.routing_control_arn
                      state               = routing_control.value.state
                    }
                  }
                }
              }
            }
          }

          dynamic "aurora_provisioned_scaling_config" {
            for_each = step.value.aurora_provisioned_scaling_config != null ? step.value.aurora_provisioned_scaling_config : []
            content {
              global_cluster_identifier    = aurora_provisioned_scaling_config.value.global_cluster_identifier
              instance_arns                = aurora_provisioned_scaling_config.value.instance_arns
              region_database_cluster_arns = aurora_provisioned_scaling_config.value.region_database_cluster_arns
              cross_account_role           = aurora_provisioned_scaling_config.value.cross_account_role
              external_id                  = aurora_provisioned_scaling_config.value.external_id
              timeout_minutes              = aurora_provisioned_scaling_config.value.timeout_minutes
            }
          }

          dynamic "aurora_serverless_scaling_config" {
            for_each = step.value.aurora_serverless_scaling_config != null ? step.value.aurora_serverless_scaling_config : []
            content {
              global_cluster_identifier    = aurora_serverless_scaling_config.value.global_cluster_identifier
              region_database_cluster_arns = aurora_serverless_scaling_config.value.region_database_cluster_arns
              cross_account_role           = aurora_serverless_scaling_config.value.cross_account_role
              external_id                  = aurora_serverless_scaling_config.value.external_id
              target_percent               = aurora_serverless_scaling_config.value.target_percent
              timeout_minutes              = aurora_serverless_scaling_config.value.timeout_minutes
            }
          }

          dynamic "custom_action_lambda_config" {
            for_each = step.value.custom_action_lambda_config != null ? step.value.custom_action_lambda_config : []
            content {
              region_to_run          = custom_action_lambda_config.value.region_to_run
              retry_interval_minutes = custom_action_lambda_config.value.retry_interval_minutes
              timeout_minutes        = custom_action_lambda_config.value.timeout_minutes

              dynamic "lambda" {
                for_each = custom_action_lambda_config.value.lambda != null ? custom_action_lambda_config.value.lambda : []
                content {
                  arn                = lambda.value.arn
                  cross_account_role = lambda.value.cross_account_role
                  external_id        = lambda.value.external_id
                }
              }

              dynamic "ungraceful" {
                for_each = custom_action_lambda_config.value.ungraceful != null ? custom_action_lambda_config.value.ungraceful : []
                content {
                  behavior = ungraceful.value.behavior
                }
              }
            }
          }

          dynamic "document_db_config" {
            for_each = step.value.document_db_config != null ? step.value.document_db_config : []
            content {
              behavior                  = document_db_config.value.behavior
              database_cluster_arns     = document_db_config.value.database_cluster_arns
              global_cluster_identifier = document_db_config.value.global_cluster_identifier
              cross_account_role        = document_db_config.value.cross_account_role
              external_id               = document_db_config.value.external_id
              timeout_minutes           = document_db_config.value.timeout_minutes

              dynamic "ungraceful" {
                for_each = document_db_config.value.ungraceful != null ? document_db_config.value.ungraceful : []
                content {
                  ungraceful = ungraceful.value.ungraceful
                }
              }
            }
          }

          dynamic "ec2_asg_capacity_increase_config" {
            for_each = step.value.ec2_asg_capacity_increase_config != null ? step.value.ec2_asg_capacity_increase_config : []
            content {
              capacity_monitoring_approach = ec2_asg_capacity_increase_config.value.capacity_monitoring_approach
              target_percent               = ec2_asg_capacity_increase_config.value.target_percent
              timeout_minutes              = ec2_asg_capacity_increase_config.value.timeout_minutes

              dynamic "asg" {
                for_each = ec2_asg_capacity_increase_config.value.asg != null ? ec2_asg_capacity_increase_config.value.asg : []
                content {
                  arn                = asg.value.arn
                  cross_account_role = asg.value.cross_account_role
                  external_id        = asg.value.external_id
                }
              }

              dynamic "ungraceful" {
                for_each = ec2_asg_capacity_increase_config.value.ungraceful != null ? ec2_asg_capacity_increase_config.value.ungraceful : []
                content {
                  minimum_success_percentage = ungraceful.value.minimum_success_percentage
                }
              }
            }
          }

          dynamic "ecs_capacity_increase_config" {
            for_each = step.value.ecs_capacity_increase_config != null ? step.value.ecs_capacity_increase_config : []
            content {
              capacity_monitoring_approach = ecs_capacity_increase_config.value.capacity_monitoring_approach
              target_percent               = ecs_capacity_increase_config.value.target_percent
              timeout_minutes              = ecs_capacity_increase_config.value.timeout_minutes

              dynamic "service" {
                for_each = ecs_capacity_increase_config.value.service != null ? ecs_capacity_increase_config.value.service : []
                content {
                  cluster_arn        = service.value.cluster_arn
                  service_arn        = service.value.service_arn
                  cross_account_role = service.value.cross_account_role
                  external_id        = service.value.external_id
                }
              }

              dynamic "ungraceful" {
                for_each = ecs_capacity_increase_config.value.ungraceful != null ? ecs_capacity_increase_config.value.ungraceful : []
                content {
                  minimum_success_percentage = ungraceful.value.minimum_success_percentage
                }
              }
            }
          }

          dynamic "eks_resource_scaling_config" {
            for_each = step.value.eks_resource_scaling_config != null ? step.value.eks_resource_scaling_config : []
            content {
              capacity_monitoring_approach = eks_resource_scaling_config.value.capacity_monitoring_approach
              target_percent               = eks_resource_scaling_config.value.target_percent
              timeout_minutes              = eks_resource_scaling_config.value.timeout_minutes

              dynamic "eks_clusters" {
                for_each = eks_resource_scaling_config.value.eks_clusters != null ? eks_resource_scaling_config.value.eks_clusters : []
                content {
                  cluster_arn        = eks_clusters.value.cluster_arn
                  cross_account_role = eks_clusters.value.cross_account_role
                  external_id        = eks_clusters.value.external_id
                }
              }

              dynamic "kubernetes_resource_type" {
                for_each = eks_resource_scaling_config.value.kubernetes_resource_type != null ? eks_resource_scaling_config.value.kubernetes_resource_type : []
                content {
                  api_version = kubernetes_resource_type.value.api_version
                  kind        = kubernetes_resource_type.value.kind
                }
              }

              dynamic "scaling_resources" {
                for_each = eks_resource_scaling_config.value.scaling_resources != null ? eks_resource_scaling_config.value.scaling_resources : []
                content {
                  namespace = scaling_resources.value.namespace

                  dynamic "resources" {
                    for_each = scaling_resources.value.resources != null ? scaling_resources.value.resources : []
                    content {
                      name          = resources.value.name
                      namespace     = resources.value.namespace
                      resource_name = resources.value.resource_name
                      hpa_name      = resources.value.hpa_name
                    }
                  }
                }
              }

              dynamic "ungraceful" {
                for_each = eks_resource_scaling_config.value.ungraceful != null ? eks_resource_scaling_config.value.ungraceful : []
                content {
                  minimum_success_percentage = ungraceful.value.minimum_success_percentage
                }
              }
            }
          }

          dynamic "execution_approval_config" {
            for_each = step.value.execution_approval_config != null ? step.value.execution_approval_config : []
            content {
              approval_role   = execution_approval_config.value.approval_role
              timeout_minutes = execution_approval_config.value.timeout_minutes
            }
          }

          dynamic "global_aurora_config" {
            for_each = step.value.global_aurora_config != null ? step.value.global_aurora_config : []
            content {
              behavior                  = global_aurora_config.value.behavior
              database_cluster_arns     = global_aurora_config.value.database_cluster_arns
              global_cluster_identifier = global_aurora_config.value.global_cluster_identifier
              cross_account_role        = global_aurora_config.value.cross_account_role
              external_id               = global_aurora_config.value.external_id
              timeout_minutes           = global_aurora_config.value.timeout_minutes

              dynamic "ungraceful" {
                for_each = global_aurora_config.value.ungraceful != null ? global_aurora_config.value.ungraceful : []
                content {
                  ungraceful = ungraceful.value.ungraceful
                }
              }
            }
          }

          dynamic "lambda_event_source_mapping_config" {
            for_each = step.value.lambda_event_source_mapping_config != null ? step.value.lambda_event_source_mapping_config : []
            content {
              action          = lambda_event_source_mapping_config.value.action
              timeout_minutes = lambda_event_source_mapping_config.value.timeout_minutes

              dynamic "region_event_source_mapping" {
                for_each = lambda_event_source_mapping_config.value.region_event_source_mapping != null ? lambda_event_source_mapping_config.value.region_event_source_mapping : []
                content {
                  arn                = region_event_source_mapping.value.arn
                  region             = region_event_source_mapping.value.region
                  cross_account_role = region_event_source_mapping.value.cross_account_role
                  external_id        = region_event_source_mapping.value.external_id
                }
              }

              dynamic "ungraceful" {
                for_each = lambda_event_source_mapping_config.value.ungraceful != null ? lambda_event_source_mapping_config.value.ungraceful : []
                content {
                  behavior = ungraceful.value.behavior
                }
              }
            }
          }

          dynamic "neptune_global_database_config" {
            for_each = step.value.neptune_global_database_config != null ? step.value.neptune_global_database_config : []
            content {
              behavior                     = neptune_global_database_config.value.behavior
              global_cluster_identifier    = neptune_global_database_config.value.global_cluster_identifier
              region_database_cluster_arns = neptune_global_database_config.value.region_database_cluster_arns
              cross_account_role           = neptune_global_database_config.value.cross_account_role
              external_id                  = neptune_global_database_config.value.external_id
              timeout_minutes              = neptune_global_database_config.value.timeout_minutes

              dynamic "ungraceful" {
                for_each = neptune_global_database_config.value.ungraceful != null ? neptune_global_database_config.value.ungraceful : []
                content {
                  ungraceful = ungraceful.value.ungraceful
                }
              }
            }
          }

          dynamic "parallel_config" {
            for_each = step.value.parallel_config != null ? step.value.parallel_config : []
            content {

              dynamic "step" {
                for_each = parallel_config.value.step != null ? parallel_config.value.step : []
                content {
                  execution_block_type = step.value.execution_block_type
                  name                 = step.value.name
                  description          = step.value.description

                  dynamic "arc_routing_control_config" {
                    for_each = step.value.arc_routing_control_config != null ? step.value.arc_routing_control_config : []
                    content {
                      cross_account_role = arc_routing_control_config.value.cross_account_role
                      external_id        = arc_routing_control_config.value.external_id
                      timeout_minutes    = arc_routing_control_config.value.timeout_minutes

                      dynamic "region_and_routing_controls" {
                        for_each = arc_routing_control_config.value.region_and_routing_controls != null ? arc_routing_control_config.value.region_and_routing_controls : []
                        content {
                          region = region_and_routing_controls.value.region

                          dynamic "routing_control" {
                            for_each = region_and_routing_controls.value.routing_control != null ? region_and_routing_controls.value.routing_control : []
                            content {
                              routing_control_arn = routing_control.value.routing_control_arn
                              state               = routing_control.value.state
                            }
                          }
                        }
                      }
                    }
                  }

                  dynamic "aurora_provisioned_scaling_config" {
                    for_each = step.value.aurora_provisioned_scaling_config != null ? step.value.aurora_provisioned_scaling_config : []
                    content {
                      global_cluster_identifier    = aurora_provisioned_scaling_config.value.global_cluster_identifier
                      instance_arns                = aurora_provisioned_scaling_config.value.instance_arns
                      region_database_cluster_arns = aurora_provisioned_scaling_config.value.region_database_cluster_arns
                      cross_account_role           = aurora_provisioned_scaling_config.value.cross_account_role
                      external_id                  = aurora_provisioned_scaling_config.value.external_id
                      timeout_minutes              = aurora_provisioned_scaling_config.value.timeout_minutes
                    }
                  }

                  dynamic "aurora_serverless_scaling_config" {
                    for_each = step.value.aurora_serverless_scaling_config != null ? step.value.aurora_serverless_scaling_config : []
                    content {
                      global_cluster_identifier    = aurora_serverless_scaling_config.value.global_cluster_identifier
                      region_database_cluster_arns = aurora_serverless_scaling_config.value.region_database_cluster_arns
                      cross_account_role           = aurora_serverless_scaling_config.value.cross_account_role
                      external_id                  = aurora_serverless_scaling_config.value.external_id
                      target_percent               = aurora_serverless_scaling_config.value.target_percent
                      timeout_minutes              = aurora_serverless_scaling_config.value.timeout_minutes
                    }
                  }

                  dynamic "custom_action_lambda_config" {
                    for_each = step.value.custom_action_lambda_config != null ? step.value.custom_action_lambda_config : []
                    content {
                      region_to_run          = custom_action_lambda_config.value.region_to_run
                      retry_interval_minutes = custom_action_lambda_config.value.retry_interval_minutes
                      timeout_minutes        = custom_action_lambda_config.value.timeout_minutes

                      dynamic "lambda" {
                        for_each = custom_action_lambda_config.value.lambda != null ? custom_action_lambda_config.value.lambda : []
                        content {
                          arn                = lambda.value.arn
                          cross_account_role = lambda.value.cross_account_role
                          external_id        = lambda.value.external_id
                        }
                      }

                      dynamic "ungraceful" {
                        for_each = custom_action_lambda_config.value.ungraceful != null ? custom_action_lambda_config.value.ungraceful : []
                        content {
                          behavior = ungraceful.value.behavior
                        }
                      }
                    }
                  }

                  dynamic "document_db_config" {
                    for_each = step.value.document_db_config != null ? step.value.document_db_config : []
                    content {
                      behavior                  = document_db_config.value.behavior
                      database_cluster_arns     = document_db_config.value.database_cluster_arns
                      global_cluster_identifier = document_db_config.value.global_cluster_identifier
                      cross_account_role        = document_db_config.value.cross_account_role
                      external_id               = document_db_config.value.external_id
                      timeout_minutes           = document_db_config.value.timeout_minutes

                      dynamic "ungraceful" {
                        for_each = document_db_config.value.ungraceful != null ? document_db_config.value.ungraceful : []
                        content {
                          ungraceful = ungraceful.value.ungraceful
                        }
                      }
                    }
                  }

                  dynamic "ec2_asg_capacity_increase_config" {
                    for_each = step.value.ec2_asg_capacity_increase_config != null ? step.value.ec2_asg_capacity_increase_config : []
                    content {
                      capacity_monitoring_approach = ec2_asg_capacity_increase_config.value.capacity_monitoring_approach
                      target_percent               = ec2_asg_capacity_increase_config.value.target_percent
                      timeout_minutes              = ec2_asg_capacity_increase_config.value.timeout_minutes

                      dynamic "asg" {
                        for_each = ec2_asg_capacity_increase_config.value.asg != null ? ec2_asg_capacity_increase_config.value.asg : []
                        content {
                          arn                = asg.value.arn
                          cross_account_role = asg.value.cross_account_role
                          external_id        = asg.value.external_id
                        }
                      }

                      dynamic "ungraceful" {
                        for_each = ec2_asg_capacity_increase_config.value.ungraceful != null ? ec2_asg_capacity_increase_config.value.ungraceful : []
                        content {
                          minimum_success_percentage = ungraceful.value.minimum_success_percentage
                        }
                      }
                    }
                  }

                  dynamic "ecs_capacity_increase_config" {
                    for_each = step.value.ecs_capacity_increase_config != null ? step.value.ecs_capacity_increase_config : []
                    content {
                      capacity_monitoring_approach = ecs_capacity_increase_config.value.capacity_monitoring_approach
                      target_percent               = ecs_capacity_increase_config.value.target_percent
                      timeout_minutes              = ecs_capacity_increase_config.value.timeout_minutes

                      dynamic "service" {
                        for_each = ecs_capacity_increase_config.value.service != null ? ecs_capacity_increase_config.value.service : []
                        content {
                          cluster_arn        = service.value.cluster_arn
                          service_arn        = service.value.service_arn
                          cross_account_role = service.value.cross_account_role
                          external_id        = service.value.external_id
                        }
                      }

                      dynamic "ungraceful" {
                        for_each = ecs_capacity_increase_config.value.ungraceful != null ? ecs_capacity_increase_config.value.ungraceful : []
                        content {
                          minimum_success_percentage = ungraceful.value.minimum_success_percentage
                        }
                      }
                    }
                  }

                  dynamic "eks_resource_scaling_config" {
                    for_each = step.value.eks_resource_scaling_config != null ? step.value.eks_resource_scaling_config : []
                    content {
                      capacity_monitoring_approach = eks_resource_scaling_config.value.capacity_monitoring_approach
                      target_percent               = eks_resource_scaling_config.value.target_percent
                      timeout_minutes              = eks_resource_scaling_config.value.timeout_minutes

                      dynamic "eks_clusters" {
                        for_each = eks_resource_scaling_config.value.eks_clusters != null ? eks_resource_scaling_config.value.eks_clusters : []
                        content {
                          cluster_arn        = eks_clusters.value.cluster_arn
                          cross_account_role = eks_clusters.value.cross_account_role
                          external_id        = eks_clusters.value.external_id
                        }
                      }

                      dynamic "kubernetes_resource_type" {
                        for_each = eks_resource_scaling_config.value.kubernetes_resource_type != null ? eks_resource_scaling_config.value.kubernetes_resource_type : []
                        content {
                          api_version = kubernetes_resource_type.value.api_version
                          kind        = kubernetes_resource_type.value.kind
                        }
                      }

                      dynamic "scaling_resources" {
                        for_each = eks_resource_scaling_config.value.scaling_resources != null ? eks_resource_scaling_config.value.scaling_resources : []
                        content {
                          namespace = scaling_resources.value.namespace

                          dynamic "resources" {
                            for_each = scaling_resources.value.resources != null ? scaling_resources.value.resources : []
                            content {
                              name          = resources.value.name
                              namespace     = resources.value.namespace
                              resource_name = resources.value.resource_name
                              hpa_name      = resources.value.hpa_name
                            }
                          }
                        }
                      }

                      dynamic "ungraceful" {
                        for_each = eks_resource_scaling_config.value.ungraceful != null ? eks_resource_scaling_config.value.ungraceful : []
                        content {
                          minimum_success_percentage = ungraceful.value.minimum_success_percentage
                        }
                      }
                    }
                  }

                  dynamic "execution_approval_config" {
                    for_each = step.value.execution_approval_config != null ? step.value.execution_approval_config : []
                    content {
                      approval_role   = execution_approval_config.value.approval_role
                      timeout_minutes = execution_approval_config.value.timeout_minutes
                    }
                  }

                  dynamic "global_aurora_config" {
                    for_each = step.value.global_aurora_config != null ? step.value.global_aurora_config : []
                    content {
                      behavior                  = global_aurora_config.value.behavior
                      database_cluster_arns     = global_aurora_config.value.database_cluster_arns
                      global_cluster_identifier = global_aurora_config.value.global_cluster_identifier
                      cross_account_role        = global_aurora_config.value.cross_account_role
                      external_id               = global_aurora_config.value.external_id
                      timeout_minutes           = global_aurora_config.value.timeout_minutes

                      dynamic "ungraceful" {
                        for_each = global_aurora_config.value.ungraceful != null ? global_aurora_config.value.ungraceful : []
                        content {
                          ungraceful = ungraceful.value.ungraceful
                        }
                      }
                    }
                  }

                  dynamic "lambda_event_source_mapping_config" {
                    for_each = step.value.lambda_event_source_mapping_config != null ? step.value.lambda_event_source_mapping_config : []
                    content {
                      action          = lambda_event_source_mapping_config.value.action
                      timeout_minutes = lambda_event_source_mapping_config.value.timeout_minutes

                      dynamic "region_event_source_mapping" {
                        for_each = lambda_event_source_mapping_config.value.region_event_source_mapping != null ? lambda_event_source_mapping_config.value.region_event_source_mapping : []
                        content {
                          arn                = region_event_source_mapping.value.arn
                          region             = region_event_source_mapping.value.region
                          cross_account_role = region_event_source_mapping.value.cross_account_role
                          external_id        = region_event_source_mapping.value.external_id
                        }
                      }

                      dynamic "ungraceful" {
                        for_each = lambda_event_source_mapping_config.value.ungraceful != null ? lambda_event_source_mapping_config.value.ungraceful : []
                        content {
                          behavior = ungraceful.value.behavior
                        }
                      }
                    }
                  }

                  dynamic "neptune_global_database_config" {
                    for_each = step.value.neptune_global_database_config != null ? step.value.neptune_global_database_config : []
                    content {
                      behavior                     = neptune_global_database_config.value.behavior
                      global_cluster_identifier    = neptune_global_database_config.value.global_cluster_identifier
                      region_database_cluster_arns = neptune_global_database_config.value.region_database_cluster_arns
                      cross_account_role           = neptune_global_database_config.value.cross_account_role
                      external_id                  = neptune_global_database_config.value.external_id
                      timeout_minutes              = neptune_global_database_config.value.timeout_minutes

                      dynamic "ungraceful" {
                        for_each = neptune_global_database_config.value.ungraceful != null ? neptune_global_database_config.value.ungraceful : []
                        content {
                          ungraceful = ungraceful.value.ungraceful
                        }
                      }
                    }
                  }

                  dynamic "rds_create_cross_region_read_replica_config" {
                    for_each = step.value.rds_create_cross_region_read_replica_config != null ? step.value.rds_create_cross_region_read_replica_config : []
                    content {
                      db_instance_arn_map = rds_create_cross_region_read_replica_config.value.db_instance_arn_map
                      cross_account_role  = rds_create_cross_region_read_replica_config.value.cross_account_role
                      external_id         = rds_create_cross_region_read_replica_config.value.external_id
                      timeout_minutes     = rds_create_cross_region_read_replica_config.value.timeout_minutes
                    }
                  }

                  dynamic "rds_promote_read_replica_config" {
                    for_each = step.value.rds_promote_read_replica_config != null ? step.value.rds_promote_read_replica_config : []
                    content {
                      db_instance_arn_map = rds_promote_read_replica_config.value.db_instance_arn_map
                      cross_account_role  = rds_promote_read_replica_config.value.cross_account_role
                      external_id         = rds_promote_read_replica_config.value.external_id
                      timeout_minutes     = rds_promote_read_replica_config.value.timeout_minutes
                    }
                  }

                  dynamic "region_switch_plan_config" {
                    for_each = step.value.region_switch_plan_config != null ? step.value.region_switch_plan_config : []
                    content {
                      arn                = region_switch_plan_config.value.arn
                      cross_account_role = region_switch_plan_config.value.cross_account_role
                      external_id        = region_switch_plan_config.value.external_id
                    }
                  }

                  dynamic "route53_health_check_config" {
                    for_each = step.value.route53_health_check_config != null ? step.value.route53_health_check_config : []
                    content {
                      hosted_zone_id     = route53_health_check_config.value.hosted_zone_id
                      record_name        = route53_health_check_config.value.record_name
                      cross_account_role = route53_health_check_config.value.cross_account_role
                      external_id        = route53_health_check_config.value.external_id
                      timeout_minutes    = route53_health_check_config.value.timeout_minutes

                      dynamic "record_set" {
                        for_each = route53_health_check_config.value.record_set != null ? route53_health_check_config.value.record_set : []
                        content {
                          record_set_identifier = record_set.value.record_set_identifier
                          region                = record_set.value.region
                        }
                      }
                    }
                  }
                }
              }
            }
          }

          dynamic "rds_create_cross_region_read_replica_config" {
            for_each = step.value.rds_create_cross_region_read_replica_config != null ? step.value.rds_create_cross_region_read_replica_config : []
            content {
              db_instance_arn_map = rds_create_cross_region_read_replica_config.value.db_instance_arn_map
              cross_account_role  = rds_create_cross_region_read_replica_config.value.cross_account_role
              external_id         = rds_create_cross_region_read_replica_config.value.external_id
              timeout_minutes     = rds_create_cross_region_read_replica_config.value.timeout_minutes
            }
          }

          dynamic "rds_promote_read_replica_config" {
            for_each = step.value.rds_promote_read_replica_config != null ? step.value.rds_promote_read_replica_config : []
            content {
              db_instance_arn_map = rds_promote_read_replica_config.value.db_instance_arn_map
              cross_account_role  = rds_promote_read_replica_config.value.cross_account_role
              external_id         = rds_promote_read_replica_config.value.external_id
              timeout_minutes     = rds_promote_read_replica_config.value.timeout_minutes
            }
          }

          dynamic "region_switch_plan_config" {
            for_each = step.value.region_switch_plan_config != null ? step.value.region_switch_plan_config : []
            content {
              arn                = region_switch_plan_config.value.arn
              cross_account_role = region_switch_plan_config.value.cross_account_role
              external_id        = region_switch_plan_config.value.external_id
            }
          }

          dynamic "route53_health_check_config" {
            for_each = step.value.route53_health_check_config != null ? step.value.route53_health_check_config : []
            content {
              hosted_zone_id     = route53_health_check_config.value.hosted_zone_id
              record_name        = route53_health_check_config.value.record_name
              cross_account_role = route53_health_check_config.value.cross_account_role
              external_id        = route53_health_check_config.value.external_id
              timeout_minutes    = route53_health_check_config.value.timeout_minutes

              dynamic "record_set" {
                for_each = route53_health_check_config.value.record_set != null ? route53_health_check_config.value.record_set : []
                content {
                  record_set_identifier = record_set.value.record_set_identifier
                  region                = record_set.value.region
                }
              }
            }
          }
        }
      }
    }
  }
}
