variable "sagemaker_algorithms" {
  description = <<EOT
Map of sagemaker_algorithms, attributes below
Required:
    - algorithm_name
Optional:
    - algorithm_description
    - certify_for_marketplace
    - region
    - tags
    - inference_specification
    - training_specification
    - validation_specification
EOT

  type = map(object({
    algorithm_name           = string
    algorithm_description    = optional(string)
    certify_for_marketplace  = optional(bool)
    region                   = optional(string)
    tags                     = optional(map(string))
    inference_specification  = optional(list(object({
            supported_content_types                     = optional(list(string))
            supported_realtime_inference_instance_types = optional(list(string))
            supported_response_mime_types               = optional(list(string))
            supported_transform_instance_types          = optional(list(string))
            containers                                  = optional(list(object({
                container_hostname        = optional(string)
                environment               = optional(map(string))
                framework                 = optional(string)
                framework_version         = optional(string)
                image                     = optional(string)
                image_digest              = optional(string)
                is_checkpoint             = optional(bool)
                model_data_etag           = optional(string)
                model_data_url            = optional(string)
                nearest_model_name        = optional(string)
                product_id                = optional(string)
                additional_s3_data_source = optional(list(object({
                    s3_data_type     = string
                    s3_uri           = string
                    compression_type = optional(string)
                    etag             = optional(string)
                })))
                base_model                = optional(list(object({
                    hub_content_name    = optional(string)
                    hub_content_version = optional(string)
                    recipe_name         = optional(string)
                })))
                model_data_source         = optional(list(object({
                    s3_data_source = optional(list(object({
                        compression_type    = string
                        s3_data_type        = string
                        s3_uri              = string
                        etag                = optional(string)
                        manifest_etag       = optional(string)
                        manifest_s3_uri     = optional(string)
                        hub_access_config   = optional(list(object({
                            hub_content_arn = optional(string)
                        })))
                        model_access_config = optional(list(object({
                            accept_eula = optional(bool)
                        })))
                    })))
                })))
                model_input               = optional(list(object({
                    data_input_config = optional(string)
                })))
            })))
        })))
    training_specification   = optional(list(object({
            supported_training_instance_types      = list(string)
            training_image                         = string
            supports_distributed_training          = optional(bool)
            training_image_digest                  = optional(string)
            additional_s3_data_source              = optional(list(object({
                s3_data_type     = string
                s3_uri           = string
                compression_type = optional(string)
                etag             = optional(string)
            })))
            metric_definitions                     = optional(list(object({
                name  = string
                regex = string
            })))
            supported_hyper_parameters             = optional(list(object({
                name          = string
                type          = string
                default_value = optional(string)
                description   = optional(string)
                is_required   = optional(bool)
                is_tunable    = optional(bool)
                range         = optional(list(object({
                    categorical_parameter_range_specification = optional(list(object({
                        values = list(string)
                    })))
                    continuous_parameter_range_specification  = optional(list(object({
                        max_value = string
                        min_value = string
                    })))
                    integer_parameter_range_specification     = optional(list(object({
                        max_value = string
                        min_value = string
                    })))
                })))
            })))
            supported_tuning_job_objective_metrics = optional(list(object({
                metric_name = string
                type        = string
            })))
            training_channels                      = optional(list(object({
                name                        = string
                supported_content_types     = list(string)
                supported_input_modes       = list(string)
                description                 = optional(string)
                is_required                 = optional(bool)
                supported_compression_types = optional(list(string))
            })))
        })))
    validation_specification = optional(list(object({
            validation_role     = string
            validation_profiles = optional(list(object({
                profile_name             = string
                training_job_definition  = optional(list(object({
                    training_input_mode = string
                    hyper_parameters    = optional(map(string))
                    input_data_config   = optional(list(object({
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
                                    hub_content_arn = optional(string)
                                })))
                                model_access_config       = optional(list(object({
                                    accept_eula = optional(bool)
                                })))
                            })))
                        })))
                        shuffle_config      = optional(list(object({
                            seed = number
                        })))
                    })))
                    output_data_config  = optional(list(object({
                        s3_output_path   = string
                        compression_type = optional(string)
                        kms_key_id       = optional(string)
                    })))
                    resource_config     = optional(list(object({
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
                    stopping_condition  = optional(list(object({
                        max_pending_time_in_seconds = optional(number)
                        max_runtime_in_seconds      = optional(number)
                        max_wait_time_in_seconds    = optional(number)
                    })))
                })))
                transform_job_definition = optional(list(object({
                    batch_strategy            = optional(string)
                    environment               = optional(map(string))
                    max_concurrent_transforms = optional(number)
                    max_payload_in_mb         = optional(number)
                    transform_input           = optional(list(object({
                        compression_type = optional(string)
                        content_type     = optional(string)
                        split_type       = optional(string)
                        data_source      = optional(list(object({
                            s3_data_source = optional(list(object({
                                s3_data_type = string
                                s3_uri       = string
                            })))
                        })))
                    })))
                    transform_output          = optional(list(object({
                        s3_output_path = string
                        accept         = optional(string)
                        assemble_with  = optional(string)
                        kms_key_id     = optional(string)
                    })))
                    transform_resources       = optional(list(object({
                        instance_count        = number
                        instance_type         = string
                        transform_ami_version = optional(string)
                        volume_kms_key_id     = optional(string)
                    })))
                })))
            })))
        })))
  }))
}
