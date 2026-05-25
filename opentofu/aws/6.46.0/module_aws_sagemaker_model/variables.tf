variable "sagemaker_models" {
  description = <<EOT
Map of sagemaker_models, attributes below
Required:
    - execution_role_arn
Optional:
    - enable_network_isolation
    - name
    - region
    - tags
    - tags_all
    - container
    - inference_execution_config
    - primary_container
    - vpc_config
EOT

  type = map(object({
    execution_role_arn         = string
    enable_network_isolation   = optional(bool)
    name                       = optional(string)
    region                     = optional(string)
    tags                       = optional(map(string))
    tags_all                   = optional(map(string))
    container                  = optional(list(object({
            container_hostname           = optional(string)
            environment                  = optional(map(string))
            image                        = optional(string)
            inference_specification_name = optional(string)
            mode                         = optional(string)
            model_data_url               = optional(string)
            model_package_name           = optional(string)
            additional_model_data_source = optional(list(object({
                channel_name   = string
                s3_data_source = list(object({
                    compression_type    = string
                    s3_data_type        = string
                    s3_uri              = string
                    model_access_config = optional(list(object({
                        accept_eula = bool
                    })))
                }))
            })))
            image_config                 = optional(list(object({
                repository_access_mode = string
                repository_auth_config = optional(list(object({
                    repository_credentials_provider_arn = string
                })))
            })))
            model_data_source            = optional(list(object({
                s3_data_source = list(object({
                    compression_type    = string
                    s3_data_type        = string
                    s3_uri              = string
                    model_access_config = optional(list(object({
                        accept_eula = bool
                    })))
                }))
            })))
            multi_model_config           = optional(list(object({
                model_cache_setting = optional(string)
            })))
        })))
    inference_execution_config = optional(list(object({
            mode = string
        })))
    primary_container          = optional(list(object({
            container_hostname           = optional(string)
            environment                  = optional(map(string))
            image                        = optional(string)
            inference_specification_name = optional(string)
            mode                         = optional(string)
            model_data_url               = optional(string)
            model_package_name           = optional(string)
            additional_model_data_source = optional(list(object({
                channel_name   = string
                s3_data_source = list(object({
                    compression_type    = string
                    s3_data_type        = string
                    s3_uri              = string
                    model_access_config = optional(list(object({
                        accept_eula = bool
                    })))
                }))
            })))
            image_config                 = optional(list(object({
                repository_access_mode = string
                repository_auth_config = optional(list(object({
                    repository_credentials_provider_arn = string
                })))
            })))
            model_data_source            = optional(list(object({
                s3_data_source = list(object({
                    compression_type    = string
                    s3_data_type        = string
                    s3_uri              = string
                    model_access_config = optional(list(object({
                        accept_eula = bool
                    })))
                }))
            })))
            multi_model_config           = optional(list(object({
                model_cache_setting = optional(string)
            })))
        })))
    vpc_config                 = optional(list(object({
            security_group_ids = set(string)
            subnets            = set(string)
        })))
  }))
}
