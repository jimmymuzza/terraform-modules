variable "sagemaker_training_jobs" {
  description = <<EOT
Map of sagemaker_training_jobs, attributes below
Required:
    - role_arn
    - training_job_name
Optional:
    - delete_model_packages_on_destroy
    - delete_vpc_enis_on_destroy
    - enable_inter_container_traffic_encryption
    - enable_managed_spot_training
    - enable_network_isolation
    - environment
    - hyper_parameters
    - region
    - tags
    - algorithm_specification
    - checkpoint_config
    - debug_hook_config
    - debug_rule_configurations
    - experiment_config
    - infra_check_config
    - input_data_config
    - mlflow_config
    - model_package_config
    - output_data_config
    - profiler_config
    - profiler_rule_configurations
    - remote_debug_config
    - resource_config
    - retry_strategy
    - serverless_job_config
    - session_chaining_config
    - stopping_condition
    - tensor_board_output_config
    - vpc_config
EOT

  type = map(object({
    role_arn                                  = string
    training_job_name                         = string
    delete_model_packages_on_destroy          = optional(bool)
    delete_vpc_enis_on_destroy                = optional(bool)
    enable_inter_container_traffic_encryption = optional(bool)
    enable_managed_spot_training              = optional(bool)
    enable_network_isolation                  = optional(bool)
    environment                               = optional(map(string))
    hyper_parameters                          = optional(map(string))
    region                                    = optional(string)
    tags                                      = optional(map(string))
    algorithm_specification                   = optional(list(object({
            algorithm_name                       = optional(string)
            container_arguments                  = optional(list(string))
            container_entrypoint                 = optional(list(string))
            enable_sagemaker_metrics_time_series = optional(bool)
            training_image                       = optional(string)
            training_input_mode                  = optional(string)
            metric_definitions                   = optional(list(object({
                name  = string
                regex = string
            })))
            training_image_config                = optional(list(object({
                training_repository_access_mode = optional(string)
                training_repository_auth_config = optional(list(object({
                    training_repository_credentials_provider_arn = optional(string)
                })))
            })))
        })))
    checkpoint_config                         = optional(list(object({
            s3_uri     = string
            local_path = optional(string)
        })))
    debug_hook_config                         = optional(list(object({
            s3_output_path            = string
            hook_parameters           = optional(map(string))
            local_path                = optional(string)
            collection_configurations = optional(list(object({
                collection_name       = optional(string)
                collection_parameters = optional(map(string))
            })))
        })))
    debug_rule_configurations                 = optional(list(object({
            rule_configuration_name = string
            rule_evaluator_image    = string
            instance_type           = optional(string)
            local_path              = optional(string)
            rule_parameters         = optional(map(string))
            s3_output_path          = optional(string)
            volume_size_in_gb       = optional(number)
        })))
    experiment_config                         = optional(list(object({
            experiment_name              = optional(string)
            run_name                     = optional(string)
            trial_component_display_name = optional(string)
            trial_name                   = optional(string)
        })))
    infra_check_config                        = optional(list(object({
            enable_infra_check = optional(bool)
        })))
    input_data_config                         = optional(list(object({
            channel_name        = string
            compression_type    = optional(string)
            content_type        = optional(string)
            input_mode          = optional(string)
            record_wrapper_type = optional(string)
            data_source         = optional(list(object({
                file_system_data_source = optional(list(object({
                    directory_path          = string
                    file_system_access_mode = string
                    file_system_id          = string
                    file_system_type        = string
                })))
                s3_data_source          = optional(list(object({
                    s3_data_type              = string
                    s3_uri                    = string
                    attribute_names           = optional(list(string))
                    instance_group_names      = optional(list(string))
                    s3_data_distribution_type = optional(string)
                    hub_access_config         = optional(list(object({
                        hub_content_arn = string
                    })))
                    model_access_config       = optional(list(object({
                        accept_eula = bool
                    })))
                })))
            })))
            shuffle_config      = optional(list(object({
                seed = optional(number)
            })))
        })))
    mlflow_config                             = optional(list(object({
            mlflow_resource_arn    = string
            mlflow_experiment_name = optional(string)
            mlflow_run_name        = optional(string)
        })))
    model_package_config                      = optional(list(object({
            model_package_group_arn  = string
            source_model_package_arn = optional(string)
        })))
    output_data_config                        = optional(list(object({
            s3_output_path   = string
            compression_type = optional(string)
            kms_key_id       = optional(string)
        })))
    profiler_config                           = optional(list(object({
            disable_profiler                   = optional(bool)
            profiling_interval_in_milliseconds = optional(number)
            profiling_parameters               = optional(map(string))
            s3_output_path                     = optional(string)
        })))
    profiler_rule_configurations              = optional(list(object({
            rule_configuration_name = string
            rule_evaluator_image    = string
            instance_type           = optional(string)
            local_path              = optional(string)
            rule_parameters         = optional(map(string))
            s3_output_path          = optional(string)
            volume_size_in_gb       = optional(number)
        })))
    remote_debug_config                       = optional(list(object({
            enable_remote_debug = optional(bool)
        })))
    resource_config                           = optional(list(object({
            instance_count               = optional(number)
            instance_type                = optional(string)
            keep_alive_period_in_seconds = optional(number)
            training_plan_arn            = optional(string)
            volume_kms_key_id            = optional(string)
            volume_size_in_gb            = optional(number)
            instance_groups              = optional(list(object({
                instance_count      = optional(number)
                instance_group_name = optional(string)
                instance_type       = optional(string)
            })))
            instance_placement_config    = optional(list(object({
                enable_multiple_jobs     = optional(bool)
                placement_specifications = optional(list(object({
                    instance_count  = optional(number)
                    ultra_server_id = optional(string)
                })))
            })))
        })))
    retry_strategy                            = optional(list(object({
            maximum_retry_attempts = number
        })))
    serverless_job_config                     = optional(list(object({
            base_model_arn          = string
            job_type                = string
            accept_eula             = optional(bool)
            customization_technique = optional(string)
            evaluation_type         = optional(string)
            evaluator_arn           = optional(string)
            peft                    = optional(string)
        })))
    session_chaining_config                   = optional(list(object({
            enable_session_tag_chaining = optional(bool)
        })))
    stopping_condition                        = optional(list(object({
            max_pending_time_in_seconds = optional(number)
            max_runtime_in_seconds      = optional(number)
            max_wait_time_in_seconds    = optional(number)
        })))
    tensor_board_output_config                = optional(list(object({
            s3_output_path = string
            local_path     = optional(string)
        })))
    vpc_config                                = optional(list(object({
            security_group_ids = list(string)
            subnets            = list(string)
        })))
  }))
}
