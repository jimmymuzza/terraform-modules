variable "sagemaker_endpoint_configurations" {
  description = <<EOT
Map of sagemaker_endpoint_configurations, attributes below
Required:
    - production_variants
Optional:
    - execution_role_arn
    - kms_key_arn
    - name
    - name_prefix
    - region
    - tags
    - tags_all
    - async_inference_config
    - data_capture_config
    - shadow_production_variants
EOT

  type = map(object({
    execution_role_arn         = optional(string)
    kms_key_arn                = optional(string)
    name                       = optional(string)
    name_prefix                = optional(string)
    region                     = optional(string)
    tags                       = optional(map(string))
    tags_all                   = optional(map(string))
    async_inference_config     = optional(list(object({
            client_config = optional(list(object({
                max_concurrent_invocations_per_instance = optional(number)
            })))
            output_config = list(object({
                s3_output_path      = string
                kms_key_id          = optional(string)
                s3_failure_path     = optional(string)
                notification_config = optional(list(object({
                    error_topic                   = optional(string)
                    include_inference_response_in = optional(set(string))
                    success_topic                 = optional(string)
                })))
            }))
        })))
    data_capture_config        = optional(list(object({
            destination_s3_uri          = string
            initial_sampling_percentage = number
            enable_capture              = optional(bool)
            kms_key_id                  = optional(string)
            capture_content_type_header = optional(list(object({
                csv_content_types  = optional(set(string))
                json_content_types = optional(set(string))
            })))
            capture_options             = list(object({
                capture_mode = string
            }))
        })))
    production_variants        = list(object({
            accelerator_type                                  = optional(string)
            container_startup_health_check_timeout_in_seconds = optional(number)
            enable_ssm_access                                 = optional(bool)
            inference_ami_version                             = optional(string)
            initial_instance_count                            = optional(number)
            initial_variant_weight                            = optional(number)
            instance_type                                     = optional(string)
            model_data_download_timeout_in_seconds            = optional(number)
            model_name                                        = optional(string)
            variant_name                                      = optional(string)
            volume_size_in_gb                                 = optional(number)
            capacity_reservation_config                       = optional(list(object({
                capacity_reservation_preference = optional(string)
                ml_reservation_arn              = optional(string)
            })))
            core_dump_config                                  = optional(list(object({
                destination_s3_uri = string
                kms_key_id         = optional(string)
            })))
            managed_instance_scaling                          = optional(list(object({
                max_instance_count = optional(number)
                min_instance_count = optional(number)
                status             = optional(string)
            })))
            routing_config                                    = optional(list(object({
                routing_strategy = string
            })))
            serverless_config                                 = optional(list(object({
                max_concurrency         = number
                memory_size_in_mb       = number
                provisioned_concurrency = optional(number)
            })))
        }))
    shadow_production_variants = optional(list(object({
            accelerator_type                                  = optional(string)
            container_startup_health_check_timeout_in_seconds = optional(number)
            enable_ssm_access                                 = optional(bool)
            inference_ami_version                             = optional(string)
            initial_instance_count                            = optional(number)
            initial_variant_weight                            = optional(number)
            instance_type                                     = optional(string)
            model_data_download_timeout_in_seconds            = optional(number)
            model_name                                        = optional(string)
            variant_name                                      = optional(string)
            volume_size_in_gb                                 = optional(number)
            capacity_reservation_config                       = optional(list(object({
                capacity_reservation_preference = optional(string)
                ml_reservation_arn              = optional(string)
            })))
            core_dump_config                                  = optional(list(object({
                destination_s3_uri = string
                kms_key_id         = string
            })))
            managed_instance_scaling                          = optional(list(object({
                max_instance_count = optional(number)
                min_instance_count = optional(number)
                status             = optional(string)
            })))
            routing_config                                    = optional(list(object({
                routing_strategy = string
            })))
            serverless_config                                 = optional(list(object({
                max_concurrency         = number
                memory_size_in_mb       = number
                provisioned_concurrency = optional(number)
            })))
        })))
  }))
}
