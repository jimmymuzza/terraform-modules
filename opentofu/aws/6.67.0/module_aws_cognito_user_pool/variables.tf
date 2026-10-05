variable "cognito_user_pools" {
  description = <<EOT
Map of cognito_user_pools, attributes below
Required:
    - name
Optional:
    - alias_attributes
    - auto_verified_attributes
    - deletion_protection
    - email_verification_message
    - email_verification_subject
    - mfa_configuration
    - region
    - sms_authentication_message
    - sms_verification_message
    - tags
    - tags_all
    - user_pool_tier
    - username_attributes
    - account_recovery_setting
    - admin_create_user_config
    - device_configuration
    - email_configuration
    - email_mfa_configuration
    - lambda_config
    - password_policy
    - schema
    - sign_in_policy
    - sms_configuration
    - software_token_mfa_configuration
    - user_attribute_update_settings
    - user_pool_add_ons
    - username_configuration
    - verification_message_template
    - web_authn_configuration
EOT

  type = map(object({
    name                             = string
    alias_attributes                 = optional(set(string))
    auto_verified_attributes         = optional(set(string))
    deletion_protection              = optional(string)
    email_verification_message       = optional(string)
    email_verification_subject       = optional(string)
    mfa_configuration                = optional(string)
    region                           = optional(string)
    sms_authentication_message       = optional(string)
    sms_verification_message         = optional(string)
    tags                             = optional(map(string))
    tags_all                         = optional(map(string))
    user_pool_tier                   = optional(string)
    username_attributes              = optional(set(string))
    account_recovery_setting         = optional(list(object({
            recovery_mechanism = optional(set(object({
                name     = string
                priority = number
            })))
        })))
    admin_create_user_config         = optional(list(object({
            allow_admin_create_user_only = optional(bool)
            invite_message_template      = optional(list(object({
                email_message = optional(string)
                email_subject = optional(string)
                sms_message   = optional(string)
            })))
        })))
    device_configuration             = optional(list(object({
            challenge_required_on_new_device      = optional(bool)
            device_only_remembered_on_user_prompt = optional(bool)
        })))
    email_configuration              = optional(list(object({
            configuration_set      = optional(string)
            email_sending_account  = optional(string)
            from_email_address     = optional(string)
            reply_to_email_address = optional(string)
            source_arn             = optional(string)
        })))
    email_mfa_configuration          = optional(list(object({
            message = optional(string)
            subject = optional(string)
        })))
    lambda_config                    = optional(list(object({
            create_auth_challenge          = optional(string)
            custom_message                 = optional(string)
            define_auth_challenge          = optional(string)
            kms_key_id                     = optional(string)
            post_authentication            = optional(string)
            post_confirmation              = optional(string)
            pre_authentication             = optional(string)
            pre_sign_up                    = optional(string)
            pre_token_generation           = optional(string)
            user_migration                 = optional(string)
            verify_auth_challenge_response = optional(string)
            custom_email_sender            = optional(list(object({
                lambda_arn     = string
                lambda_version = string
            })))
            custom_sms_sender              = optional(list(object({
                lambda_arn     = string
                lambda_version = string
            })))
            pre_token_generation_config    = optional(list(object({
                lambda_arn     = string
                lambda_version = string
            })))
        })))
    password_policy                  = optional(list(object({
            minimum_length                   = optional(number)
            password_history_size            = optional(number)
            require_lowercase                = optional(bool)
            require_numbers                  = optional(bool)
            require_symbols                  = optional(bool)
            require_uppercase                = optional(bool)
            temporary_password_validity_days = optional(number)
        })))
    schema                           = optional(set(object({
            attribute_data_type          = string
            name                         = string
            developer_only_attribute     = optional(bool)
            mutable                      = optional(bool)
            required                     = optional(bool)
            number_attribute_constraints = optional(list(object({
                max_value = optional(string)
                min_value = optional(string)
            })))
            string_attribute_constraints = optional(list(object({
                max_length = optional(string)
                min_length = optional(string)
            })))
        })))
    sign_in_policy                   = optional(list(object({
            allowed_first_auth_factors = optional(set(string))
        })))
    sms_configuration                = optional(list(object({
            external_id    = string
            sns_caller_arn = string
            sns_region     = optional(string)
        })))
    software_token_mfa_configuration = optional(list(object({
            enabled = bool
        })))
    user_attribute_update_settings   = optional(list(object({
            attributes_require_verification_before_update = set(string)
        })))
    user_pool_add_ons                = optional(list(object({
            advanced_security_mode             = string
            advanced_security_additional_flows = optional(list(object({
                custom_auth_mode = optional(string)
            })))
        })))
    username_configuration           = optional(list(object({
            case_sensitive = optional(bool)
        })))
    verification_message_template    = optional(list(object({
            default_email_option  = optional(string)
            email_message         = optional(string)
            email_message_by_link = optional(string)
            email_subject         = optional(string)
            email_subject_by_link = optional(string)
            sms_message           = optional(string)
        })))
    web_authn_configuration          = optional(list(object({
            relying_party_id  = optional(string)
            user_verification = optional(string)
        })))
  }))
}
