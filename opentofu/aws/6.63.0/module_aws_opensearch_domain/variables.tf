variable "opensearch_domains" {
  description = <<EOT
Map of opensearch_domains, attributes below
Required:
    - domain_name
Optional:
    - access_policies
    - advanced_options
    - engine_version
    - ip_address_type
    - region
    - tags
    - tags_all
    - advanced_security_options
    - aiml_options
    - auto_tune_options
    - cluster_config
    - cognito_options
    - deployment_strategy_options
    - domain_endpoint_options
    - ebs_options
    - encrypt_at_rest
    - identity_center_options
    - log_publishing_options
    - node_to_node_encryption
    - off_peak_window_options
    - snapshot_options
    - software_update_options
    - vpc_options
EOT

  type = map(object({
    domain_name                 = string
    access_policies             = optional(string)
    advanced_options            = optional(map(string))
    engine_version              = optional(string)
    ip_address_type             = optional(string)
    region                      = optional(string)
    tags                        = optional(map(string))
    tags_all                    = optional(map(string))
    advanced_security_options   = optional(list(object({
            enabled                        = bool
            anonymous_auth_enabled         = optional(bool)
            internal_user_database_enabled = optional(bool)
            jwt_options                    = optional(list(object({
                enabled     = optional(bool)
                jwks_url    = optional(string)
                public_key  = optional(string)
                roles_key   = optional(string)
                subject_key = optional(string)
            })))
            master_user_options            = optional(list(object({
                master_user_arn      = optional(string)
                master_user_name     = optional(string)
                master_user_password = optional(string)
            })))
        })))
    aiml_options                = optional(list(object({
            natural_language_query_generation_options = optional(list(object({
                desired_state = optional(string)
            })))
            s3_vectors_engine                         = optional(list(object({
                enabled = optional(bool)
            })))
            serverless_vector_acceleration            = optional(list(object({
                enabled = optional(bool)
            })))
        })))
    auto_tune_options           = optional(list(object({
            desired_state        = string
            rollback_on_disable  = optional(string)
            use_off_peak_window  = optional(bool)
            maintenance_schedule = optional(set(object({
                cron_expression_for_recurrence = string
                start_at                       = string
                duration                       = list(object({
                    unit  = string
                    value = number
                }))
            })))
        })))
    cluster_config              = optional(list(object({
            dedicated_master_count        = optional(number)
            dedicated_master_enabled      = optional(bool)
            dedicated_master_type         = optional(string)
            instance_count                = optional(number)
            instance_type                 = optional(string)
            multi_az_with_standby_enabled = optional(bool)
            warm_count                    = optional(number)
            warm_enabled                  = optional(bool)
            warm_type                     = optional(string)
            zone_awareness_enabled        = optional(bool)
            cold_storage_options          = optional(list(object({
                enabled = optional(bool)
            })))
            node_options                  = optional(list(object({
                node_type   = optional(string)
                node_config = optional(list(object({
                    count   = optional(number)
                    enabled = optional(bool)
                    type    = optional(string)
                })))
            })))
            zone_awareness_config         = optional(list(object({
                availability_zone_count = optional(number)
            })))
        })))
    cognito_options             = optional(list(object({
            identity_pool_id = string
            role_arn         = string
            user_pool_id     = string
            enabled          = optional(bool)
        })))
    deployment_strategy_options = optional(list(object({
            deployment_strategy = string
        })))
    domain_endpoint_options     = optional(list(object({
            custom_endpoint                 = optional(string)
            custom_endpoint_certificate_arn = optional(string)
            custom_endpoint_enabled         = optional(bool)
            enforce_https                   = optional(bool)
            tls_security_policy             = optional(string)
        })))
    ebs_options                 = optional(list(object({
            ebs_enabled = bool
            iops        = optional(number)
            throughput  = optional(number)
            volume_size = optional(number)
            volume_type = optional(string)
        })))
    encrypt_at_rest             = optional(list(object({
            enabled    = bool
            kms_key_id = optional(string)
        })))
    identity_center_options     = optional(list(object({
            enabled_api_access           = optional(bool)
            identity_center_instance_arn = optional(string)
            roles_key                    = optional(string)
            subject_key                  = optional(string)
        })))
    log_publishing_options      = optional(set(object({
            cloudwatch_log_group_arn = string
            log_type                 = string
            enabled                  = optional(bool)
        })))
    node_to_node_encryption     = optional(list(object({
            enabled = bool
        })))
    off_peak_window_options     = optional(list(object({
            enabled         = optional(bool)
            off_peak_window = optional(list(object({
                window_start_time = optional(list(object({
                    hours   = optional(number)
                    minutes = optional(number)
                })))
            })))
        })))
    snapshot_options            = optional(list(object({
            automated_snapshot_start_hour = number
        })))
    software_update_options     = optional(list(object({
            auto_software_update_enabled = optional(bool)
        })))
    vpc_options                 = optional(list(object({
            security_group_ids = optional(set(string))
            subnet_ids         = optional(set(string))
        })))
  }))
}
