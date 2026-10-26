variable "sagemaker_inference_components" {
  description = <<EOT
Map of sagemaker_inference_components, attributes below
Required:
    - endpoint_name
    - name
Optional:
    - region
    - tags
    - variant_name
    - deployment_config
    - runtime_config
    - specification
    - specifications
EOT

  type = map(object({
    endpoint_name     = string
    name              = string
    region            = optional(string)
    tags              = optional(map(string))
    variant_name      = optional(string)
    deployment_config = optional(list(object({
            auto_rollback_configuration = optional(list(object({
                alarms = optional(list(object({
                    alarm_name = string
                })))
            })))
            rolling_update_policy       = optional(list(object({
                wait_interval_in_seconds             = number
                maximum_execution_timeout_in_seconds = optional(number)
                maximum_batch_size                   = optional(list(object({
                    type  = string
                    value = number
                })))
                rollback_maximum_batch_size          = optional(list(object({
                    type  = string
                    value = number
                })))
            })))
        })))
    runtime_config    = optional(list(object({
            copy_count = number
        })))
    specification     = optional(list(object({
            base_inference_component_name = optional(string)
            instance_type                 = optional(string)
            model_name                    = optional(string)
            compute_resource_requirements = optional(list(object({
                min_memory_required_in_mb              = number
                max_memory_required_in_mb              = optional(number)
                number_of_accelerator_devices_required = optional(number)
                number_of_cpu_cores_required           = optional(number)
            })))
            container                     = optional(list(object({
                artifact_url             = optional(string)
                environment              = optional(map(string))
                image                    = optional(string)
                container_metrics_config = optional(list(object({
                    metrics_endpoint = optional(list(object({
                        metrics_endpoint_path               = string
                        metric_publish_frequency_in_seconds = optional(number)
                    })))
                })))
            })))
            data_cache_config             = optional(list(object({
                enable_caching = bool
            })))
            scheduling_config             = optional(list(object({
                placement_strategy        = string
                availability_zone_balance = optional(list(object({
                    enforcement_mode = string
                    max_imbalance    = optional(number)
                })))
            })))
            startup_parameters            = optional(list(object({
                container_startup_health_check_timeout_in_seconds = optional(number)
                model_data_download_timeout_in_seconds            = optional(number)
            })))
        })))
    specifications    = optional(list(object({
            base_inference_component_name = optional(string)
            instance_type                 = optional(string)
            model_name                    = optional(string)
            compute_resource_requirements = optional(list(object({
                min_memory_required_in_mb              = number
                max_memory_required_in_mb              = optional(number)
                number_of_accelerator_devices_required = optional(number)
                number_of_cpu_cores_required           = optional(number)
            })))
            container                     = optional(list(object({
                artifact_url             = optional(string)
                environment              = optional(map(string))
                image                    = optional(string)
                container_metrics_config = optional(list(object({
                    metrics_endpoint = optional(list(object({
                        metrics_endpoint_path               = string
                        metric_publish_frequency_in_seconds = optional(number)
                    })))
                })))
            })))
            data_cache_config             = optional(list(object({
                enable_caching = bool
            })))
            scheduling_config             = optional(list(object({
                placement_strategy        = string
                availability_zone_balance = optional(list(object({
                    enforcement_mode = string
                    max_imbalance    = optional(number)
                })))
            })))
            startup_parameters            = optional(list(object({
                container_startup_health_check_timeout_in_seconds = optional(number)
                model_data_download_timeout_in_seconds            = optional(number)
            })))
        })))
  }))
}
