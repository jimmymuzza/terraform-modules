variable "sagemaker_hyper_parameter_tuning_jobs" {
  description = <<EOT
Map of sagemaker_hyper_parameter_tuning_jobs, attributes below
Required:
    - name
Optional:
    - region
    - tags
    - autotune
    - config
    - training_job_definition
    - training_job_definitions
    - warm_start_config
EOT

  type = map(object({
    name                     = string
    region                   = optional(string)
    tags                     = optional(map(string))
    autotune                 = optional(list(object({
            mode = string
        })))
    config                   = optional(list(object({
            strategy                         = string
            random_seed                      = optional(number)
            training_job_early_stopping_type = optional(string)
            objective                        = optional(list(object({
                metric_name = string
                type        = string
            })))
            parameter_ranges                 = optional(list(object({
                auto_parameters              = optional(list(object({
                    name       = string
                    value_hint = string
                })))
                categorical_parameter_ranges = optional(list(object({
                    name   = string
                    values = set(string)
                })))
                continuous_parameter_ranges  = optional(list(object({
                    max_value    = string
                    min_value    = string
                    name         = string
                    scaling_type = optional(string)
                })))
                integer_parameter_ranges     = optional(list(object({
                    max_value    = string
                    min_value    = string
                    name         = string
                    scaling_type = optional(string)
                })))
            })))
            resource_limits                  = optional(list(object({
                max_parallel_training_jobs  = number
                max_number_of_training_jobs = optional(number)
                max_runtime_in_seconds      = optional(number)
            })))
            strategy_config                  = optional(list(object({
                hyperband_strategy_config = optional(list(object({
                    max_resource = optional(number)
                    min_resource = optional(number)
                })))
            })))
            tuning_job_completion_criteria   = optional(list(object({
                target_objective_metric_value = optional(number)
                best_objective_not_improving  = optional(list(object({
                    max_number_of_training_jobs_not_improving = optional(number)
                })))
                convergence_detected          = optional(list(object({
                    complete_on_convergence = optional(string)
                })))
            })))
        })))
    training_job_definition  = optional(list(object({
            role_arn                                  = string
            definition_name                           = optional(string)
            enable_inter_container_traffic_encryption = optional(bool)
            enable_managed_spot_training              = optional(bool)
            enable_network_isolation                  = optional(bool)
            environment                               = optional(map(string))
            retry_strategy                            = optional(list(object({
                maximum_retry_attempts = number
            })))
            static_hyper_parameters                   = optional(map(string))
            algorithm_specification                   = optional(list(object({
                training_input_mode = string
                algorithm_name      = optional(string)
                training_image      = optional(string)
                metric_definitions  = optional(list(object({
                    name  = string
                    regex = string
                })))
            })))
            checkpoint_config                         = optional(list(object({
                s3_uri     = string
                local_path = optional(string)
            })))
            hyper_parameter_ranges                    = optional(list(object({
                auto_parameters              = optional(list(object({
                    name       = string
                    value_hint = string
                })))
                categorical_parameter_ranges = optional(list(object({
                    name   = string
                    values = set(string)
                })))
                continuous_parameter_ranges  = optional(list(object({
                    max_value    = string
                    min_value    = string
                    name         = string
                    scaling_type = optional(string)
                })))
                integer_parameter_ranges     = optional(list(object({
                    max_value    = string
                    min_value    = string
                    name         = string
                    scaling_type = optional(string)
                })))
            })))
            hyper_parameter_tuning_resource_config    = optional(list(object({
                allocation_strategy = optional(string)
                instance_count      = optional(number)
                instance_type       = optional(string)
                volume_kms_key_id   = optional(string)
                volume_size_in_gb   = optional(number)
                instance_configs    = optional(list(object({
                    instance_count    = optional(number)
                    instance_type     = optional(string)
                    volume_size_in_gb = optional(number)
                })))
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
                        attribute_names           = optional(set(string))
                        instance_group_names      = optional(set(string))
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
                    seed = number
                })))
            })))
            output_data_config                        = optional(list(object({
                s3_output_path   = string
                compression_type = optional(string)
                kms_key_id       = optional(string)
            })))
            resource_config                           = optional(list(object({
                instance_count               = optional(number)
                instance_type                = optional(string)
                keep_alive_period_in_seconds = optional(number)
                training_plan_arn            = optional(string)
                volume_kms_key_id            = optional(string)
                volume_size_in_gb            = optional(number)
                instance_groups              = optional(list(object({
                    instance_count      = number
                    instance_group_name = string
                    instance_type       = string
                })))
                instance_placement_config    = optional(list(object({
                    enable_multiple_jobs     = optional(bool)
                    placement_specifications = optional(list(object({
                        instance_count  = number
                        ultra_server_id = optional(string)
                    })))
                })))
            })))
            stopping_condition                        = optional(list(object({
                max_pending_time_in_seconds = optional(number)
                max_runtime_in_seconds      = optional(number)
                max_wait_time_in_seconds    = optional(number)
            })))
            tuning_objective                          = optional(list(object({
                metric_name = string
                type        = string
            })))
            vpc_config                                = optional(list(object({
                security_group_ids = set(string)
                subnets            = set(string)
            })))
        })))
    training_job_definitions = optional(list(object({
            role_arn                                  = string
            definition_name                           = optional(string)
            enable_inter_container_traffic_encryption = optional(bool)
            enable_managed_spot_training              = optional(bool)
            enable_network_isolation                  = optional(bool)
            environment                               = optional(map(string))
            retry_strategy                            = optional(list(object({
                maximum_retry_attempts = number
            })))
            static_hyper_parameters                   = optional(map(string))
            algorithm_specification                   = optional(list(object({
                training_input_mode = string
                algorithm_name      = optional(string)
                training_image      = optional(string)
                metric_definitions  = optional(list(object({
                    name  = string
                    regex = string
                })))
            })))
            checkpoint_config                         = optional(list(object({
                s3_uri     = string
                local_path = optional(string)
            })))
            hyper_parameter_ranges                    = optional(list(object({
                auto_parameters              = optional(list(object({
                    name       = string
                    value_hint = string
                })))
                categorical_parameter_ranges = optional(list(object({
                    name   = string
                    values = set(string)
                })))
                continuous_parameter_ranges  = optional(list(object({
                    max_value    = string
                    min_value    = string
                    name         = string
                    scaling_type = optional(string)
                })))
                integer_parameter_ranges     = optional(list(object({
                    max_value    = string
                    min_value    = string
                    name         = string
                    scaling_type = optional(string)
                })))
            })))
            hyper_parameter_tuning_resource_config    = optional(list(object({
                allocation_strategy = optional(string)
                instance_count      = optional(number)
                instance_type       = optional(string)
                volume_kms_key_id   = optional(string)
                volume_size_in_gb   = optional(number)
                instance_configs    = optional(list(object({
                    instance_count    = optional(number)
                    instance_type     = optional(string)
                    volume_size_in_gb = optional(number)
                })))
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
                        attribute_names           = optional(set(string))
                        instance_group_names      = optional(set(string))
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
                    seed = number
                })))
            })))
            output_data_config                        = optional(list(object({
                s3_output_path   = string
                compression_type = optional(string)
                kms_key_id       = optional(string)
            })))
            resource_config                           = optional(list(object({
                instance_count               = optional(number)
                instance_type                = optional(string)
                keep_alive_period_in_seconds = optional(number)
                training_plan_arn            = optional(string)
                volume_kms_key_id            = optional(string)
                volume_size_in_gb            = optional(number)
                instance_groups              = optional(list(object({
                    instance_count      = number
                    instance_group_name = string
                    instance_type       = string
                })))
                instance_placement_config    = optional(list(object({
                    enable_multiple_jobs     = optional(bool)
                    placement_specifications = optional(list(object({
                        instance_count  = number
                        ultra_server_id = optional(string)
                    })))
                })))
            })))
            stopping_condition                        = optional(list(object({
                max_pending_time_in_seconds = optional(number)
                max_runtime_in_seconds      = optional(number)
                max_wait_time_in_seconds    = optional(number)
            })))
            tuning_objective                          = optional(list(object({
                metric_name = string
                type        = string
            })))
            vpc_config                                = optional(list(object({
                security_group_ids = set(string)
                subnets            = set(string)
            })))
        })))
    warm_start_config        = optional(list(object({
            warm_start_type                    = optional(string)
            parent_hyper_parameter_tuning_jobs = optional(list(object({
                name = string
            })))
        })))
  }))
}
