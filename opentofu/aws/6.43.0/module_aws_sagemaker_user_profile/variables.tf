variable "sagemaker_user_profiles" {
  description = <<EOT
Map of sagemaker_user_profiles, attributes below
Required:
    - domain_id
    - user_profile_name
Optional:
    - region
    - single_sign_on_user_identifier
    - single_sign_on_user_value
    - tags
    - tags_all
    - user_settings
EOT

  type = map(object({
    domain_id                      = string
    user_profile_name              = string
    region                         = optional(string)
    single_sign_on_user_identifier = optional(string)
    single_sign_on_user_value      = optional(string)
    tags                           = optional(map(string))
    tags_all                       = optional(map(string))
    user_settings                  = optional(list(object({
            execution_role                   = string
            auto_mount_home_efs              = optional(string)
            default_landing_uri              = optional(string)
            security_groups                  = optional(set(string))
            studio_web_portal                = optional(string)
            canvas_app_settings              = optional(list(object({
                direct_deploy_settings           = optional(list(object({
                    status = optional(string)
                })))
                emr_serverless_settings          = optional(list(object({
                    execution_role_arn = optional(string)
                    status             = optional(string)
                })))
                generative_ai_settings           = optional(list(object({
                    amazon_bedrock_role_arn = optional(string)
                })))
                identity_provider_oauth_settings = optional(list(object({
                    secret_arn       = string
                    data_source_name = optional(string)
                    status           = optional(string)
                })))
                kendra_settings                  = optional(list(object({
                    status = optional(string)
                })))
                model_register_settings          = optional(list(object({
                    cross_account_model_register_role_arn = optional(string)
                    status                                = optional(string)
                })))
                time_series_forecasting_settings = optional(list(object({
                    amazon_forecast_role_arn = optional(string)
                    status                   = optional(string)
                })))
                workspace_settings               = optional(list(object({
                    s3_artifact_path = optional(string)
                    s3_kms_key_id    = optional(string)
                })))
            })))
            code_editor_app_settings         = optional(list(object({
                built_in_lifecycle_config_arn = optional(string)
                lifecycle_config_arns         = optional(set(string))
                app_lifecycle_management      = optional(list(object({
                    idle_settings = optional(list(object({
                        idle_timeout_in_minutes     = optional(number)
                        lifecycle_management        = optional(string)
                        max_idle_timeout_in_minutes = optional(number)
                        min_idle_timeout_in_minutes = optional(number)
                    })))
                })))
                custom_image                  = optional(list(object({
                    app_image_config_name = string
                    image_name            = string
                    image_version_number  = optional(number)
                })))
                default_resource_spec         = optional(list(object({
                    instance_type                 = optional(string)
                    lifecycle_config_arn          = optional(string)
                    sagemaker_image_arn           = optional(string)
                    sagemaker_image_version_alias = optional(string)
                    sagemaker_image_version_arn   = optional(string)
                })))
            })))
            custom_file_system_config        = optional(list(object({
                efs_file_system_config = optional(list(object({
                    file_system_id   = string
                    file_system_path = optional(string)
                })))
            })))
            custom_posix_user_config         = optional(list(object({
                gid = number
                uid = number
            })))
            jupyter_lab_app_settings         = optional(list(object({
                built_in_lifecycle_config_arn = optional(string)
                lifecycle_config_arns         = optional(set(string))
                app_lifecycle_management      = optional(list(object({
                    idle_settings = optional(list(object({
                        idle_timeout_in_minutes     = optional(number)
                        lifecycle_management        = optional(string)
                        max_idle_timeout_in_minutes = optional(number)
                        min_idle_timeout_in_minutes = optional(number)
                    })))
                })))
                code_repository               = optional(set(object({
                    repository_url = string
                })))
                custom_image                  = optional(list(object({
                    app_image_config_name = string
                    image_name            = string
                    image_version_number  = optional(number)
                })))
                default_resource_spec         = optional(list(object({
                    instance_type                 = optional(string)
                    lifecycle_config_arn          = optional(string)
                    sagemaker_image_arn           = optional(string)
                    sagemaker_image_version_alias = optional(string)
                    sagemaker_image_version_arn   = optional(string)
                })))
                emr_settings                  = optional(list(object({
                    assumable_role_arns = optional(set(string))
                    execution_role_arns = optional(set(string))
                })))
            })))
            jupyter_server_app_settings      = optional(list(object({
                lifecycle_config_arns = optional(set(string))
                code_repository       = optional(set(object({
                    repository_url = string
                })))
                default_resource_spec = optional(list(object({
                    instance_type                 = optional(string)
                    lifecycle_config_arn          = optional(string)
                    sagemaker_image_arn           = optional(string)
                    sagemaker_image_version_alias = optional(string)
                    sagemaker_image_version_arn   = optional(string)
                })))
            })))
            kernel_gateway_app_settings      = optional(list(object({
                lifecycle_config_arns = optional(set(string))
                custom_image          = optional(list(object({
                    app_image_config_name = string
                    image_name            = string
                    image_version_number  = optional(number)
                })))
                default_resource_spec = optional(list(object({
                    instance_type                 = optional(string)
                    lifecycle_config_arn          = optional(string)
                    sagemaker_image_arn           = optional(string)
                    sagemaker_image_version_alias = optional(string)
                    sagemaker_image_version_arn   = optional(string)
                })))
            })))
            r_session_app_settings           = optional(list(object({
                custom_image          = optional(list(object({
                    app_image_config_name = string
                    image_name            = string
                    image_version_number  = optional(number)
                })))
                default_resource_spec = optional(list(object({
                    instance_type                 = optional(string)
                    lifecycle_config_arn          = optional(string)
                    sagemaker_image_arn           = optional(string)
                    sagemaker_image_version_alias = optional(string)
                    sagemaker_image_version_arn   = optional(string)
                })))
            })))
            r_studio_server_pro_app_settings = optional(list(object({
                access_status = optional(string)
                user_group    = optional(string)
            })))
            sharing_settings                 = optional(list(object({
                notebook_output_option = optional(string)
                s3_kms_key_id          = optional(string)
                s3_output_path         = optional(string)
            })))
            space_storage_settings           = optional(list(object({
                default_ebs_storage_settings = optional(list(object({
                    default_ebs_volume_size_in_gb = number
                    maximum_ebs_volume_size_in_gb = number
                })))
            })))
            studio_web_portal_settings       = optional(list(object({
                hidden_app_types      = optional(set(string))
                hidden_instance_types = optional(set(string))
                hidden_ml_tools       = optional(set(string))
            })))
            tensor_board_app_settings        = optional(list(object({
                default_resource_spec = optional(list(object({
                    instance_type                 = optional(string)
                    lifecycle_config_arn          = optional(string)
                    sagemaker_image_arn           = optional(string)
                    sagemaker_image_version_alias = optional(string)
                    sagemaker_image_version_arn   = optional(string)
                })))
            })))
        })))
  }))
}
