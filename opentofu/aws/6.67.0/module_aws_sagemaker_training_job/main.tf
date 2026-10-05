resource "aws_sagemaker_training_job" "sagemaker_training_jobs" {
  for_each = var.sagemaker_training_jobs

  role_arn                                  = each.value.role_arn
  training_job_name                         = each.value.training_job_name
  delete_model_packages_on_destroy          = each.value.delete_model_packages_on_destroy
  delete_vpc_enis_on_destroy                = each.value.delete_vpc_enis_on_destroy
  enable_inter_container_traffic_encryption = each.value.enable_inter_container_traffic_encryption
  enable_managed_spot_training              = each.value.enable_managed_spot_training
  enable_network_isolation                  = each.value.enable_network_isolation
  environment                               = each.value.environment
  hyper_parameters                          = each.value.hyper_parameters
  region                                    = each.value.region
  tags                                      = each.value.tags

  dynamic "algorithm_specification" {
    for_each = each.value.algorithm_specification != null ? each.value.algorithm_specification : []
    content {
      algorithm_name                       = algorithm_specification.value.algorithm_name
      container_arguments                  = algorithm_specification.value.container_arguments
      container_entrypoint                 = algorithm_specification.value.container_entrypoint
      enable_sagemaker_metrics_time_series = algorithm_specification.value.enable_sagemaker_metrics_time_series
      training_image                       = algorithm_specification.value.training_image
      training_input_mode                  = algorithm_specification.value.training_input_mode

      dynamic "metric_definitions" {
        for_each = algorithm_specification.value.metric_definitions != null ? algorithm_specification.value.metric_definitions : []
        content {
          name  = metric_definitions.value.name
          regex = metric_definitions.value.regex
        }
      }

      dynamic "training_image_config" {
        for_each = algorithm_specification.value.training_image_config != null ? algorithm_specification.value.training_image_config : []
        content {
          training_repository_access_mode = training_image_config.value.training_repository_access_mode

          dynamic "training_repository_auth_config" {
            for_each = training_image_config.value.training_repository_auth_config != null ? training_image_config.value.training_repository_auth_config : []
            content {
              training_repository_credentials_provider_arn = training_repository_auth_config.value.training_repository_credentials_provider_arn
            }
          }
        }
      }
    }
  }

  dynamic "checkpoint_config" {
    for_each = each.value.checkpoint_config != null ? each.value.checkpoint_config : []
    content {
      s3_uri     = checkpoint_config.value.s3_uri
      local_path = checkpoint_config.value.local_path
    }
  }

  dynamic "debug_hook_config" {
    for_each = each.value.debug_hook_config != null ? each.value.debug_hook_config : []
    content {
      s3_output_path  = debug_hook_config.value.s3_output_path
      hook_parameters = debug_hook_config.value.hook_parameters
      local_path      = debug_hook_config.value.local_path

      dynamic "collection_configurations" {
        for_each = debug_hook_config.value.collection_configurations != null ? debug_hook_config.value.collection_configurations : []
        content {
          collection_name       = collection_configurations.value.collection_name
          collection_parameters = collection_configurations.value.collection_parameters
        }
      }
    }
  }

  dynamic "debug_rule_configurations" {
    for_each = each.value.debug_rule_configurations != null ? each.value.debug_rule_configurations : []
    content {
      rule_configuration_name = debug_rule_configurations.value.rule_configuration_name
      rule_evaluator_image    = debug_rule_configurations.value.rule_evaluator_image
      instance_type           = debug_rule_configurations.value.instance_type
      local_path              = debug_rule_configurations.value.local_path
      rule_parameters         = debug_rule_configurations.value.rule_parameters
      s3_output_path          = debug_rule_configurations.value.s3_output_path
      volume_size_in_gb       = debug_rule_configurations.value.volume_size_in_gb
    }
  }

  dynamic "experiment_config" {
    for_each = each.value.experiment_config != null ? each.value.experiment_config : []
    content {
      experiment_name              = experiment_config.value.experiment_name
      run_name                     = experiment_config.value.run_name
      trial_component_display_name = experiment_config.value.trial_component_display_name
      trial_name                   = experiment_config.value.trial_name
    }
  }

  dynamic "infra_check_config" {
    for_each = each.value.infra_check_config != null ? each.value.infra_check_config : []
    content {
      enable_infra_check = infra_check_config.value.enable_infra_check
    }
  }

  dynamic "input_data_config" {
    for_each = each.value.input_data_config != null ? each.value.input_data_config : []
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

  dynamic "mlflow_config" {
    for_each = each.value.mlflow_config != null ? each.value.mlflow_config : []
    content {
      mlflow_resource_arn    = mlflow_config.value.mlflow_resource_arn
      mlflow_experiment_name = mlflow_config.value.mlflow_experiment_name
      mlflow_run_name        = mlflow_config.value.mlflow_run_name
    }
  }

  dynamic "model_package_config" {
    for_each = each.value.model_package_config != null ? each.value.model_package_config : []
    content {
      model_package_group_arn  = model_package_config.value.model_package_group_arn
      source_model_package_arn = model_package_config.value.source_model_package_arn
    }
  }

  dynamic "output_data_config" {
    for_each = each.value.output_data_config != null ? each.value.output_data_config : []
    content {
      s3_output_path   = output_data_config.value.s3_output_path
      compression_type = output_data_config.value.compression_type
      kms_key_id       = output_data_config.value.kms_key_id
    }
  }

  dynamic "profiler_config" {
    for_each = each.value.profiler_config != null ? each.value.profiler_config : []
    content {
      disable_profiler                   = profiler_config.value.disable_profiler
      profiling_interval_in_milliseconds = profiler_config.value.profiling_interval_in_milliseconds
      profiling_parameters               = profiler_config.value.profiling_parameters
      s3_output_path                     = profiler_config.value.s3_output_path
    }
  }

  dynamic "profiler_rule_configurations" {
    for_each = each.value.profiler_rule_configurations != null ? each.value.profiler_rule_configurations : []
    content {
      rule_configuration_name = profiler_rule_configurations.value.rule_configuration_name
      rule_evaluator_image    = profiler_rule_configurations.value.rule_evaluator_image
      instance_type           = profiler_rule_configurations.value.instance_type
      local_path              = profiler_rule_configurations.value.local_path
      rule_parameters         = profiler_rule_configurations.value.rule_parameters
      s3_output_path          = profiler_rule_configurations.value.s3_output_path
      volume_size_in_gb       = profiler_rule_configurations.value.volume_size_in_gb
    }
  }

  dynamic "remote_debug_config" {
    for_each = each.value.remote_debug_config != null ? each.value.remote_debug_config : []
    content {
      enable_remote_debug = remote_debug_config.value.enable_remote_debug
    }
  }

  dynamic "resource_config" {
    for_each = each.value.resource_config != null ? each.value.resource_config : []
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

  dynamic "retry_strategy" {
    for_each = each.value.retry_strategy != null ? each.value.retry_strategy : []
    content {
      maximum_retry_attempts = retry_strategy.value.maximum_retry_attempts
    }
  }

  dynamic "serverless_job_config" {
    for_each = each.value.serverless_job_config != null ? each.value.serverless_job_config : []
    content {
      base_model_arn          = serverless_job_config.value.base_model_arn
      job_type                = serverless_job_config.value.job_type
      accept_eula             = serverless_job_config.value.accept_eula
      customization_technique = serverless_job_config.value.customization_technique
      evaluation_type         = serverless_job_config.value.evaluation_type
      evaluator_arn           = serverless_job_config.value.evaluator_arn
      peft                    = serverless_job_config.value.peft
    }
  }

  dynamic "session_chaining_config" {
    for_each = each.value.session_chaining_config != null ? each.value.session_chaining_config : []
    content {
      enable_session_tag_chaining = session_chaining_config.value.enable_session_tag_chaining
    }
  }

  dynamic "stopping_condition" {
    for_each = each.value.stopping_condition != null ? each.value.stopping_condition : []
    content {
      max_pending_time_in_seconds = stopping_condition.value.max_pending_time_in_seconds
      max_runtime_in_seconds      = stopping_condition.value.max_runtime_in_seconds
      max_wait_time_in_seconds    = stopping_condition.value.max_wait_time_in_seconds
    }
  }

  dynamic "tensor_board_output_config" {
    for_each = each.value.tensor_board_output_config != null ? each.value.tensor_board_output_config : []
    content {
      s3_output_path = tensor_board_output_config.value.s3_output_path
      local_path     = tensor_board_output_config.value.local_path
    }
  }

  dynamic "vpc_config" {
    for_each = each.value.vpc_config != null ? each.value.vpc_config : []
    content {
      security_group_ids = vpc_config.value.security_group_ids
      subnets            = vpc_config.value.subnets
    }
  }
}
