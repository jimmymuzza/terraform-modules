variable "sagemaker_monitoring_schedules" {
  description = <<EOT
Map of sagemaker_monitoring_schedules, attributes below
Required:
    - monitoring_schedule_config
Optional:
    - name
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name                       = optional(string)
    region                     = optional(string)
    tags                       = optional(map(string))
    tags_all                   = optional(map(string))
    monitoring_schedule_config = list(object({
            monitoring_type                = string
            monitoring_job_definition_name = optional(string)
            monitoring_job_definition      = optional(list(object({
                role_arn                     = string
                environment                  = optional(map(string))
                baseline                     = optional(list(object({
                    baselining_job_name  = optional(string)
                    constraints_resource = optional(list(object({
                        s3_uri = optional(string)
                    })))
                    statistics_resource  = optional(list(object({
                        s3_uri = optional(string)
                    })))
                })))
                monitoring_app_specification = list(object({
                    image_uri                           = string
                    container_arguments                 = optional(list(string))
                    container_entrypoint                = optional(list(string))
                    post_analytics_processor_source_uri = optional(string)
                    record_preprocessor_source_uri      = optional(string)
                }))
                monitoring_inputs            = list(object({
                    batch_transform_input = optional(list(object({
                        data_captured_destination_s3_uri = string
                        local_path                       = string
                        end_time_offset                  = optional(string)
                        exclude_features_attribute       = optional(string)
                        features_attribute               = optional(string)
                        inference_attribute              = optional(string)
                        probability_attribute            = optional(string)
                        probability_threshold_attribute  = optional(number)
                        s3_data_distribution_type        = optional(string)
                        s3_input_mode                    = optional(string)
                        start_time_offset                = optional(string)
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
                        endpoint_name                   = string
                        local_path                      = string
                        end_time_offset                 = optional(string)
                        exclude_features_attribute      = optional(string)
                        features_attribute              = optional(string)
                        inference_attribute             = optional(string)
                        probability_attribute           = optional(string)
                        probability_threshold_attribute = optional(number)
                        s3_data_distribution_type       = optional(string)
                        s3_input_mode                   = optional(string)
                        start_time_offset               = optional(string)
                    })))
                }))
                monitoring_output_config     = list(object({
                    kms_key_id         = optional(string)
                    monitoring_outputs = list(object({
                        s3_output = list(object({
                            local_path     = string
                            s3_uri         = string
                            s3_upload_mode = optional(string)
                        }))
                    }))
                }))
                monitoring_resources         = list(object({
                    cluster_config = list(object({
                        instance_count    = number
                        instance_type     = string
                        volume_size_in_gb = number
                        volume_kms_key_id = optional(string)
                    }))
                }))
                network_config               = optional(list(object({
                    enable_inter_container_traffic_encryption = optional(bool)
                    enable_network_isolation                  = optional(bool)
                    vpc_config                                = optional(list(object({
                        security_group_ids = set(string)
                        subnets            = set(string)
                    })))
                })))
                stopping_condition           = optional(list(object({
                    max_runtime_in_seconds = optional(number)
                })))
            })))
            schedule_config                = optional(list(object({
                schedule_expression = string
            })))
        }))
  }))
}
