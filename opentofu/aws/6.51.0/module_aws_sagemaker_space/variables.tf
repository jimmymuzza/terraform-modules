variable "sagemaker_spaces" {
  description = <<EOT
Map of sagemaker_spaces, attributes below
Required:
    - domain_id
    - space_name
Optional:
    - region
    - space_display_name
    - tags
    - tags_all
    - ownership_settings
    - space_settings
    - space_sharing_settings
EOT

  type = map(object({
    domain_id              = string
    space_name             = string
    region                 = optional(string)
    space_display_name     = optional(string)
    tags                   = optional(map(string))
    tags_all               = optional(map(string))
    ownership_settings     = optional(list(object({
            owner_user_profile_name = string
        })))
    space_settings         = optional(list(object({
            app_type                    = optional(string)
            code_editor_app_settings    = optional(list(object({
                app_lifecycle_management = optional(list(object({
                    idle_settings = optional(list(object({
                        idle_timeout_in_minutes = optional(number)
                    })))
                })))
                default_resource_spec    = list(object({
                    instance_type                 = optional(string)
                    lifecycle_config_arn          = optional(string)
                    sagemaker_image_arn           = optional(string)
                    sagemaker_image_version_alias = optional(string)
                    sagemaker_image_version_arn   = optional(string)
                }))
            })))
            custom_file_system          = optional(list(object({
                efs_file_system = list(object({
                    file_system_id = string
                }))
            })))
            jupyter_lab_app_settings    = optional(list(object({
                app_lifecycle_management = optional(list(object({
                    idle_settings = optional(list(object({
                        idle_timeout_in_minutes = optional(number)
                    })))
                })))
                code_repository          = optional(set(object({
                    repository_url = string
                })))
                default_resource_spec    = list(object({
                    instance_type                 = optional(string)
                    lifecycle_config_arn          = optional(string)
                    sagemaker_image_arn           = optional(string)
                    sagemaker_image_version_alias = optional(string)
                    sagemaker_image_version_arn   = optional(string)
                }))
            })))
            jupyter_server_app_settings = optional(list(object({
                lifecycle_config_arns = optional(set(string))
                code_repository       = optional(set(object({
                    repository_url = string
                })))
                default_resource_spec = list(object({
                    instance_type                 = optional(string)
                    lifecycle_config_arn          = optional(string)
                    sagemaker_image_arn           = optional(string)
                    sagemaker_image_version_alias = optional(string)
                    sagemaker_image_version_arn   = optional(string)
                }))
            })))
            kernel_gateway_app_settings = optional(list(object({
                lifecycle_config_arns = optional(set(string))
                custom_image          = optional(list(object({
                    app_image_config_name = string
                    image_name            = string
                    image_version_number  = optional(number)
                })))
                default_resource_spec = list(object({
                    instance_type                 = optional(string)
                    lifecycle_config_arn          = optional(string)
                    sagemaker_image_arn           = optional(string)
                    sagemaker_image_version_alias = optional(string)
                    sagemaker_image_version_arn   = optional(string)
                }))
            })))
            space_storage_settings      = optional(list(object({
                ebs_storage_settings = list(object({
                    ebs_volume_size_in_gb = number
                }))
            })))
        })))
    space_sharing_settings = optional(list(object({
            sharing_type = string
        })))
  }))
}
