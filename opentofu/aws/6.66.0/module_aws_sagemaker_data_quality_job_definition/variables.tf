variable "sagemaker_data_quality_job_definitions" {
  description = <<EOT
Map of sagemaker_data_quality_job_definitions, attributes below
Required:
    - role_arn
    - data_quality_app_specification
    - data_quality_job_input
    - data_quality_job_output_config
    - job_resources
Optional:
    - name
    - region
    - tags
    - tags_all
    - data_quality_baseline_config
    - network_config
    - stopping_condition
EOT

  type = map(object({
    role_arn                       = string
    name                           = optional(string)
    region                         = optional(string)
    tags                           = optional(map(string))
    tags_all                       = optional(map(string))
    data_quality_app_specification = list(object({
            image_uri                           = string
            environment                         = optional(map(string))
            post_analytics_processor_source_uri = optional(string)
            record_preprocessor_source_uri      = optional(string)
        }))
    data_quality_baseline_config   = optional(list(object({
            constraints_resource = optional(list(object({
                s3_uri = optional(string)
            })))
            statistics_resource  = optional(list(object({
                s3_uri = optional(string)
            })))
        })))
    data_quality_job_input         = list(object({
            batch_transform_input = optional(list(object({
                data_captured_destination_s3_uri = string
                local_path                       = optional(string)
                s3_data_distribution_type        = optional(string)
                s3_input_mode                    = optional(string)
                dataset_format                   = list(object({
                    csv  = optional(list(object({
                        header = optional(bool)
                    })))
                    json = optional(list(object({
                        line = optional(bool)
                    })))
                }))
            })))
            endpoint_input        = optional(list(object({
                endpoint_name             = string
                local_path                = optional(string)
                s3_data_distribution_type = optional(string)
                s3_input_mode             = optional(string)
            })))
        }))
    data_quality_job_output_config = list(object({
            kms_key_id         = optional(string)
            monitoring_outputs = list(object({
                s3_output = list(object({
                    s3_uri         = string
                    local_path     = optional(string)
                    s3_upload_mode = optional(string)
                }))
            }))
        }))
    job_resources                  = list(object({
            cluster_config = list(object({
                instance_count    = number
                instance_type     = string
                volume_size_in_gb = number
                volume_kms_key_id = optional(string)
            }))
        }))
    network_config                 = optional(list(object({
            enable_inter_container_traffic_encryption = optional(bool)
            enable_network_isolation                  = optional(bool)
            vpc_config                                = optional(list(object({
                security_group_ids = set(string)
                subnets            = set(string)
            })))
        })))
    stopping_condition             = optional(list(object({
            max_runtime_in_seconds = optional(number)
        })))
  }))
}
