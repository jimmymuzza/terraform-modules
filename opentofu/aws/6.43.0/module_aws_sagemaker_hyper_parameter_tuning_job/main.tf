resource "aws_sagemaker_hyper_parameter_tuning_job" "sagemaker_hyper_parameter_tuning_jobs" {
  for_each = var.sagemaker_hyper_parameter_tuning_jobs

  name   = each.value.name
  region = each.value.region
  tags   = each.value.tags

  dynamic "autotune" {
    for_each = each.value.autotune != null ? each.value.autotune : []
    content {
      mode = autotune.value.mode
    }
  }

  dynamic "config" {
    for_each = each.value.config != null ? each.value.config : []
    content {
      strategy                         = config.value.strategy
      random_seed                      = config.value.random_seed
      training_job_early_stopping_type = config.value.training_job_early_stopping_type

      dynamic "objective" {
        for_each = config.value.objective != null ? config.value.objective : []
        content {
          metric_name = objective.value.metric_name
          type        = objective.value.type
        }
      }

      dynamic "parameter_ranges" {
        for_each = config.value.parameter_ranges != null ? config.value.parameter_ranges : []
        content {

          dynamic "auto_parameters" {
            for_each = parameter_ranges.value.auto_parameters != null ? parameter_ranges.value.auto_parameters : []
            content {
              name       = auto_parameters.value.name
              value_hint = auto_parameters.value.value_hint
            }
          }

          dynamic "categorical_parameter_ranges" {
            for_each = parameter_ranges.value.categorical_parameter_ranges != null ? parameter_ranges.value.categorical_parameter_ranges : []
            content {
              name   = categorical_parameter_ranges.value.name
              values = categorical_parameter_ranges.value.values
            }
          }

          dynamic "continuous_parameter_ranges" {
            for_each = parameter_ranges.value.continuous_parameter_ranges != null ? parameter_ranges.value.continuous_parameter_ranges : []
            content {
              max_value    = continuous_parameter_ranges.value.max_value
              min_value    = continuous_parameter_ranges.value.min_value
              name         = continuous_parameter_ranges.value.name
              scaling_type = continuous_parameter_ranges.value.scaling_type
            }
          }

          dynamic "integer_parameter_ranges" {
            for_each = parameter_ranges.value.integer_parameter_ranges != null ? parameter_ranges.value.integer_parameter_ranges : []
            content {
              max_value    = integer_parameter_ranges.value.max_value
              min_value    = integer_parameter_ranges.value.min_value
              name         = integer_parameter_ranges.value.name
              scaling_type = integer_parameter_ranges.value.scaling_type
            }
          }
        }
      }

      dynamic "resource_limits" {
        for_each = config.value.resource_limits != null ? config.value.resource_limits : []
        content {
          max_parallel_training_jobs  = resource_limits.value.max_parallel_training_jobs
          max_number_of_training_jobs = resource_limits.value.max_number_of_training_jobs
          max_runtime_in_seconds      = resource_limits.value.max_runtime_in_seconds
        }
      }

      dynamic "strategy_config" {
        for_each = config.value.strategy_config != null ? config.value.strategy_config : []
        content {

          dynamic "hyperband_strategy_config" {
            for_each = strategy_config.value.hyperband_strategy_config != null ? strategy_config.value.hyperband_strategy_config : []
            content {
              max_resource = hyperband_strategy_config.value.max_resource
              min_resource = hyperband_strategy_config.value.min_resource
            }
          }
        }
      }

      dynamic "tuning_job_completion_criteria" {
        for_each = config.value.tuning_job_completion_criteria != null ? config.value.tuning_job_completion_criteria : []
        content {
          target_objective_metric_value = tuning_job_completion_criteria.value.target_objective_metric_value

          dynamic "best_objective_not_improving" {
            for_each = tuning_job_completion_criteria.value.best_objective_not_improving != null ? tuning_job_completion_criteria.value.best_objective_not_improving : []
            content {
              max_number_of_training_jobs_not_improving = best_objective_not_improving.value.max_number_of_training_jobs_not_improving
            }
          }

          dynamic "convergence_detected" {
            for_each = tuning_job_completion_criteria.value.convergence_detected != null ? tuning_job_completion_criteria.value.convergence_detected : []
            content {
              complete_on_convergence = convergence_detected.value.complete_on_convergence
            }
          }
        }
      }
    }
  }

  dynamic "training_job_definition" {
    for_each = each.value.training_job_definition != null ? each.value.training_job_definition : []
    content {
      role_arn                                  = training_job_definition.value.role_arn
      definition_name                           = training_job_definition.value.definition_name
      enable_inter_container_traffic_encryption = training_job_definition.value.enable_inter_container_traffic_encryption
      enable_managed_spot_training              = training_job_definition.value.enable_managed_spot_training
      enable_network_isolation                  = training_job_definition.value.enable_network_isolation
      environment                               = training_job_definition.value.environment
      retry_strategy                            = training_job_definition.value.retry_strategy
      static_hyper_parameters                   = training_job_definition.value.static_hyper_parameters

      dynamic "algorithm_specification" {
        for_each = training_job_definition.value.algorithm_specification != null ? training_job_definition.value.algorithm_specification : []
        content {
          training_input_mode = algorithm_specification.value.training_input_mode
          algorithm_name      = algorithm_specification.value.algorithm_name
          training_image      = algorithm_specification.value.training_image

          dynamic "metric_definitions" {
            for_each = algorithm_specification.value.metric_definitions != null ? algorithm_specification.value.metric_definitions : []
            content {
              name  = metric_definitions.value.name
              regex = metric_definitions.value.regex
            }
          }
        }
      }

      dynamic "checkpoint_config" {
        for_each = training_job_definition.value.checkpoint_config != null ? training_job_definition.value.checkpoint_config : []
        content {
          s3_uri     = checkpoint_config.value.s3_uri
          local_path = checkpoint_config.value.local_path
        }
      }

      dynamic "hyper_parameter_ranges" {
        for_each = training_job_definition.value.hyper_parameter_ranges != null ? training_job_definition.value.hyper_parameter_ranges : []
        content {

          dynamic "auto_parameters" {
            for_each = hyper_parameter_ranges.value.auto_parameters != null ? hyper_parameter_ranges.value.auto_parameters : []
            content {
              name       = auto_parameters.value.name
              value_hint = auto_parameters.value.value_hint
            }
          }

          dynamic "categorical_parameter_ranges" {
            for_each = hyper_parameter_ranges.value.categorical_parameter_ranges != null ? hyper_parameter_ranges.value.categorical_parameter_ranges : []
            content {
              name   = categorical_parameter_ranges.value.name
              values = categorical_parameter_ranges.value.values
            }
          }

          dynamic "continuous_parameter_ranges" {
            for_each = hyper_parameter_ranges.value.continuous_parameter_ranges != null ? hyper_parameter_ranges.value.continuous_parameter_ranges : []
            content {
              max_value    = continuous_parameter_ranges.value.max_value
              min_value    = continuous_parameter_ranges.value.min_value
              name         = continuous_parameter_ranges.value.name
              scaling_type = continuous_parameter_ranges.value.scaling_type
            }
          }

          dynamic "integer_parameter_ranges" {
            for_each = hyper_parameter_ranges.value.integer_parameter_ranges != null ? hyper_parameter_ranges.value.integer_parameter_ranges : []
            content {
              max_value    = integer_parameter_ranges.value.max_value
              min_value    = integer_parameter_ranges.value.min_value
              name         = integer_parameter_ranges.value.name
              scaling_type = integer_parameter_ranges.value.scaling_type
            }
          }
        }
      }

      dynamic "hyper_parameter_tuning_resource_config" {
        for_each = training_job_definition.value.hyper_parameter_tuning_resource_config != null ? training_job_definition.value.hyper_parameter_tuning_resource_config : []
        content {
          allocation_strategy = hyper_parameter_tuning_resource_config.value.allocation_strategy
          instance_count      = hyper_parameter_tuning_resource_config.value.instance_count
          instance_type       = hyper_parameter_tuning_resource_config.value.instance_type
          volume_kms_key_id   = hyper_parameter_tuning_resource_config.value.volume_kms_key_id
          volume_size_in_gb   = hyper_parameter_tuning_resource_config.value.volume_size_in_gb

          dynamic "instance_configs" {
            for_each = hyper_parameter_tuning_resource_config.value.instance_configs != null ? hyper_parameter_tuning_resource_config.value.instance_configs : []
            content {
              instance_count    = instance_configs.value.instance_count
              instance_type     = instance_configs.value.instance_type
              volume_size_in_gb = instance_configs.value.volume_size_in_gb
            }
          }
        }
      }

      dynamic "input_data_config" {
        for_each = training_job_definition.value.input_data_config != null ? training_job_definition.value.input_data_config : []
        content {
          channel_name        = input_data_config.value.channel_name
          compression_type    = input_data_config.value.compression_type
          content_type        = input_data_config.value.content_type
          input_mode          = input_data_config.value.input_mode
          record_wrapper_type = input_data_config.value.record_wrapper_type

          dynamic "data_source" {
            for_each = input_data_config.value.data_source != null ? input_data_config.value.data_source : []
            content {

              dynamic "file_system_data_source" {
                for_each = data_source.value.file_system_data_source != null ? data_source.value.file_system_data_source : []
                content {
                  directory_path          = file_system_data_source.value.directory_path
                  file_system_access_mode = file_system_data_source.value.file_system_access_mode
                  file_system_id          = file_system_data_source.value.file_system_id
                  file_system_type        = file_system_data_source.value.file_system_type
                }
              }

              dynamic "s3_data_source" {
                for_each = data_source.value.s3_data_source != null ? data_source.value.s3_data_source : []
                content {
                  s3_data_type              = s3_data_source.value.s3_data_type
                  s3_uri                    = s3_data_source.value.s3_uri
                  attribute_names           = s3_data_source.value.attribute_names
                  instance_group_names      = s3_data_source.value.instance_group_names
                  s3_data_distribution_type = s3_data_source.value.s3_data_distribution_type

                  dynamic "hub_access_config" {
                    for_each = s3_data_source.value.hub_access_config != null ? s3_data_source.value.hub_access_config : []
                    content {
                      hub_content_arn = hub_access_config.value.hub_content_arn
                    }
                  }

                  dynamic "model_access_config" {
                    for_each = s3_data_source.value.model_access_config != null ? s3_data_source.value.model_access_config : []
                    content {
                      accept_eula = model_access_config.value.accept_eula
                    }
                  }
                }
              }
            }
          }

          dynamic "shuffle_config" {
            for_each = input_data_config.value.shuffle_config != null ? input_data_config.value.shuffle_config : []
            content {
              seed = shuffle_config.value.seed
            }
          }
        }
      }

      dynamic "output_data_config" {
        for_each = training_job_definition.value.output_data_config != null ? training_job_definition.value.output_data_config : []
        content {
          s3_output_path   = output_data_config.value.s3_output_path
          compression_type = output_data_config.value.compression_type
          kms_key_id       = output_data_config.value.kms_key_id
        }
      }

      dynamic "resource_config" {
        for_each = training_job_definition.value.resource_config != null ? training_job_definition.value.resource_config : []
        content {
          instance_count               = resource_config.value.instance_count
          instance_type                = resource_config.value.instance_type
          keep_alive_period_in_seconds = resource_config.value.keep_alive_period_in_seconds
          training_plan_arn            = resource_config.value.training_plan_arn
          volume_kms_key_id            = resource_config.value.volume_kms_key_id
          volume_size_in_gb            = resource_config.value.volume_size_in_gb

          dynamic "instance_groups" {
            for_each = resource_config.value.instance_groups != null ? resource_config.value.instance_groups : []
            content {
              instance_count      = instance_groups.value.instance_count
              instance_group_name = instance_groups.value.instance_group_name
              instance_type       = instance_groups.value.instance_type
            }
          }

          dynamic "instance_placement_config" {
            for_each = resource_config.value.instance_placement_config != null ? resource_config.value.instance_placement_config : []
            content {
              enable_multiple_jobs = instance_placement_config.value.enable_multiple_jobs

              dynamic "placement_specifications" {
                for_each = instance_placement_config.value.placement_specifications != null ? instance_placement_config.value.placement_specifications : []
                content {
                  instance_count  = placement_specifications.value.instance_count
                  ultra_server_id = placement_specifications.value.ultra_server_id
                }
              }
            }
          }
        }
      }

      dynamic "stopping_condition" {
        for_each = training_job_definition.value.stopping_condition != null ? training_job_definition.value.stopping_condition : []
        content {
          max_pending_time_in_seconds = stopping_condition.value.max_pending_time_in_seconds
          max_runtime_in_seconds      = stopping_condition.value.max_runtime_in_seconds
          max_wait_time_in_seconds    = stopping_condition.value.max_wait_time_in_seconds
        }
      }

      dynamic "tuning_objective" {
        for_each = training_job_definition.value.tuning_objective != null ? training_job_definition.value.tuning_objective : []
        content {
          metric_name = tuning_objective.value.metric_name
          type        = tuning_objective.value.type
        }
      }

      dynamic "vpc_config" {
        for_each = training_job_definition.value.vpc_config != null ? training_job_definition.value.vpc_config : []
        content {
          security_group_ids = vpc_config.value.security_group_ids
          subnets            = vpc_config.value.subnets
        }
      }
    }
  }

  dynamic "training_job_definitions" {
    for_each = each.value.training_job_definitions != null ? each.value.training_job_definitions : []
    content {
      role_arn                                  = training_job_definitions.value.role_arn
      definition_name                           = training_job_definitions.value.definition_name
      enable_inter_container_traffic_encryption = training_job_definitions.value.enable_inter_container_traffic_encryption
      enable_managed_spot_training              = training_job_definitions.value.enable_managed_spot_training
      enable_network_isolation                  = training_job_definitions.value.enable_network_isolation
      environment                               = training_job_definitions.value.environment
      retry_strategy                            = training_job_definitions.value.retry_strategy
      static_hyper_parameters                   = training_job_definitions.value.static_hyper_parameters

      dynamic "algorithm_specification" {
        for_each = training_job_definitions.value.algorithm_specification != null ? training_job_definitions.value.algorithm_specification : []
        content {
          training_input_mode = algorithm_specification.value.training_input_mode
          algorithm_name      = algorithm_specification.value.algorithm_name
          training_image      = algorithm_specification.value.training_image

          dynamic "metric_definitions" {
            for_each = algorithm_specification.value.metric_definitions != null ? algorithm_specification.value.metric_definitions : []
            content {
              name  = metric_definitions.value.name
              regex = metric_definitions.value.regex
            }
          }
        }
      }

      dynamic "checkpoint_config" {
        for_each = training_job_definitions.value.checkpoint_config != null ? training_job_definitions.value.checkpoint_config : []
        content {
          s3_uri     = checkpoint_config.value.s3_uri
          local_path = checkpoint_config.value.local_path
        }
      }

      dynamic "hyper_parameter_ranges" {
        for_each = training_job_definitions.value.hyper_parameter_ranges != null ? training_job_definitions.value.hyper_parameter_ranges : []
        content {

          dynamic "auto_parameters" {
            for_each = hyper_parameter_ranges.value.auto_parameters != null ? hyper_parameter_ranges.value.auto_parameters : []
            content {
              name       = auto_parameters.value.name
              value_hint = auto_parameters.value.value_hint
            }
          }

          dynamic "categorical_parameter_ranges" {
            for_each = hyper_parameter_ranges.value.categorical_parameter_ranges != null ? hyper_parameter_ranges.value.categorical_parameter_ranges : []
            content {
              name   = categorical_parameter_ranges.value.name
              values = categorical_parameter_ranges.value.values
            }
          }

          dynamic "continuous_parameter_ranges" {
            for_each = hyper_parameter_ranges.value.continuous_parameter_ranges != null ? hyper_parameter_ranges.value.continuous_parameter_ranges : []
            content {
              max_value    = continuous_parameter_ranges.value.max_value
              min_value    = continuous_parameter_ranges.value.min_value
              name         = continuous_parameter_ranges.value.name
              scaling_type = continuous_parameter_ranges.value.scaling_type
            }
          }

          dynamic "integer_parameter_ranges" {
            for_each = hyper_parameter_ranges.value.integer_parameter_ranges != null ? hyper_parameter_ranges.value.integer_parameter_ranges : []
            content {
              max_value    = integer_parameter_ranges.value.max_value
              min_value    = integer_parameter_ranges.value.min_value
              name         = integer_parameter_ranges.value.name
              scaling_type = integer_parameter_ranges.value.scaling_type
            }
          }
        }
      }

      dynamic "hyper_parameter_tuning_resource_config" {
        for_each = training_job_definitions.value.hyper_parameter_tuning_resource_config != null ? training_job_definitions.value.hyper_parameter_tuning_resource_config : []
        content {
          allocation_strategy = hyper_parameter_tuning_resource_config.value.allocation_strategy
          instance_count      = hyper_parameter_tuning_resource_config.value.instance_count
          instance_type       = hyper_parameter_tuning_resource_config.value.instance_type
          volume_kms_key_id   = hyper_parameter_tuning_resource_config.value.volume_kms_key_id
          volume_size_in_gb   = hyper_parameter_tuning_resource_config.value.volume_size_in_gb

          dynamic "instance_configs" {
            for_each = hyper_parameter_tuning_resource_config.value.instance_configs != null ? hyper_parameter_tuning_resource_config.value.instance_configs : []
            content {
              instance_count    = instance_configs.value.instance_count
              instance_type     = instance_configs.value.instance_type
              volume_size_in_gb = instance_configs.value.volume_size_in_gb
            }
          }
        }
      }

      dynamic "input_data_config" {
        for_each = training_job_definitions.value.input_data_config != null ? training_job_definitions.value.input_data_config : []
        content {
          channel_name        = input_data_config.value.channel_name
          compression_type    = input_data_config.value.compression_type
          content_type        = input_data_config.value.content_type
          input_mode          = input_data_config.value.input_mode
          record_wrapper_type = input_data_config.value.record_wrapper_type

          dynamic "data_source" {
            for_each = input_data_config.value.data_source != null ? input_data_config.value.data_source : []
            content {

              dynamic "file_system_data_source" {
                for_each = data_source.value.file_system_data_source != null ? data_source.value.file_system_data_source : []
                content {
                  directory_path          = file_system_data_source.value.directory_path
                  file_system_access_mode = file_system_data_source.value.file_system_access_mode
                  file_system_id          = file_system_data_source.value.file_system_id
                  file_system_type        = file_system_data_source.value.file_system_type
                }
              }

              dynamic "s3_data_source" {
                for_each = data_source.value.s3_data_source != null ? data_source.value.s3_data_source : []
                content {
                  s3_data_type              = s3_data_source.value.s3_data_type
                  s3_uri                    = s3_data_source.value.s3_uri
                  attribute_names           = s3_data_source.value.attribute_names
                  instance_group_names      = s3_data_source.value.instance_group_names
                  s3_data_distribution_type = s3_data_source.value.s3_data_distribution_type

                  dynamic "hub_access_config" {
                    for_each = s3_data_source.value.hub_access_config != null ? s3_data_source.value.hub_access_config : []
                    content {
                      hub_content_arn = hub_access_config.value.hub_content_arn
                    }
                  }

                  dynamic "model_access_config" {
                    for_each = s3_data_source.value.model_access_config != null ? s3_data_source.value.model_access_config : []
                    content {
                      accept_eula = model_access_config.value.accept_eula
                    }
                  }
                }
              }
            }
          }

          dynamic "shuffle_config" {
            for_each = input_data_config.value.shuffle_config != null ? input_data_config.value.shuffle_config : []
            content {
              seed = shuffle_config.value.seed
            }
          }
        }
      }

      dynamic "output_data_config" {
        for_each = training_job_definitions.value.output_data_config != null ? training_job_definitions.value.output_data_config : []
        content {
          s3_output_path   = output_data_config.value.s3_output_path
          compression_type = output_data_config.value.compression_type
          kms_key_id       = output_data_config.value.kms_key_id
        }
      }

      dynamic "resource_config" {
        for_each = training_job_definitions.value.resource_config != null ? training_job_definitions.value.resource_config : []
        content {
          instance_count               = resource_config.value.instance_count
          instance_type                = resource_config.value.instance_type
          keep_alive_period_in_seconds = resource_config.value.keep_alive_period_in_seconds
          training_plan_arn            = resource_config.value.training_plan_arn
          volume_kms_key_id            = resource_config.value.volume_kms_key_id
          volume_size_in_gb            = resource_config.value.volume_size_in_gb

          dynamic "instance_groups" {
            for_each = resource_config.value.instance_groups != null ? resource_config.value.instance_groups : []
            content {
              instance_count      = instance_groups.value.instance_count
              instance_group_name = instance_groups.value.instance_group_name
              instance_type       = instance_groups.value.instance_type
            }
          }

          dynamic "instance_placement_config" {
            for_each = resource_config.value.instance_placement_config != null ? resource_config.value.instance_placement_config : []
            content {
              enable_multiple_jobs = instance_placement_config.value.enable_multiple_jobs

              dynamic "placement_specifications" {
                for_each = instance_placement_config.value.placement_specifications != null ? instance_placement_config.value.placement_specifications : []
                content {
                  instance_count  = placement_specifications.value.instance_count
                  ultra_server_id = placement_specifications.value.ultra_server_id
                }
              }
            }
          }
        }
      }

      dynamic "stopping_condition" {
        for_each = training_job_definitions.value.stopping_condition != null ? training_job_definitions.value.stopping_condition : []
        content {
          max_pending_time_in_seconds = stopping_condition.value.max_pending_time_in_seconds
          max_runtime_in_seconds      = stopping_condition.value.max_runtime_in_seconds
          max_wait_time_in_seconds    = stopping_condition.value.max_wait_time_in_seconds
        }
      }

      dynamic "tuning_objective" {
        for_each = training_job_definitions.value.tuning_objective != null ? training_job_definitions.value.tuning_objective : []
        content {
          metric_name = tuning_objective.value.metric_name
          type        = tuning_objective.value.type
        }
      }

      dynamic "vpc_config" {
        for_each = training_job_definitions.value.vpc_config != null ? training_job_definitions.value.vpc_config : []
        content {
          security_group_ids = vpc_config.value.security_group_ids
          subnets            = vpc_config.value.subnets
        }
      }
    }
  }

  dynamic "warm_start_config" {
    for_each = each.value.warm_start_config != null ? each.value.warm_start_config : []
    content {
      warm_start_type = warm_start_config.value.warm_start_type

      dynamic "parent_hyper_parameter_tuning_jobs" {
        for_each = warm_start_config.value.parent_hyper_parameter_tuning_jobs != null ? warm_start_config.value.parent_hyper_parameter_tuning_jobs : []
        content {
          name = parent_hyper_parameter_tuning_jobs.value.name
        }
      }
    }
  }
}
