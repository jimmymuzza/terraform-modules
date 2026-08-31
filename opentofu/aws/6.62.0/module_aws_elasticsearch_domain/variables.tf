variable "elasticsearch_domains" {
  description = <<EOT
Map of elasticsearch_domains, attributes below
Required:
    - domain_name
Optional:
    - access_policies
    - advanced_options
    - elasticsearch_version
    - region
    - tags
    - tags_all
    - advanced_security_options
    - auto_tune_options
    - cluster_config
    - cognito_options
    - domain_endpoint_options
    - ebs_options
    - encrypt_at_rest
    - log_publishing_options
    - node_to_node_encryption
    - snapshot_options
    - vpc_options
EOT

  type = map(object({
    domain_name               = string
    access_policies           = optional(string)
    advanced_options          = optional(map(string))
    elasticsearch_version     = optional(string)
    region                    = optional(string)
    tags                      = optional(map(string))
    tags_all                  = optional(map(string))
    advanced_security_options = optional(list(object({
            enabled                        = bool
            internal_user_database_enabled = optional(bool)
            master_user_options            = optional(list(object({
                master_user_arn      = optional(string)
                master_user_name     = optional(string)
                master_user_password = optional(string)
            })))
        })))
    auto_tune_options         = optional(list(object({
            desired_state        = string
            rollback_on_disable  = optional(string)
            maintenance_schedule = optional(set(object({
                cron_expression_for_recurrence = string
                start_at                       = string
                duration                       = list(object({
                    unit  = string
                    value = number
                }))
            })))
        })))
    cluster_config            = optional(list(object({
            dedicated_master_count   = optional(number)
            dedicated_master_enabled = optional(bool)
            dedicated_master_type    = optional(string)
            instance_count           = optional(number)
            instance_type            = optional(string)
            warm_count               = optional(number)
            warm_enabled             = optional(bool)
            warm_type                = optional(string)
            zone_awareness_enabled   = optional(bool)
            cold_storage_options     = optional(list(object({
                enabled = optional(bool)
            })))
            zone_awareness_config    = optional(list(object({
                availability_zone_count = optional(number)
            })))
        })))
    cognito_options           = optional(list(object({
            identity_pool_id = string
            role_arn         = string
            user_pool_id     = string
            enabled          = optional(bool)
        })))
    domain_endpoint_options   = optional(list(object({
            custom_endpoint                 = optional(string)
            custom_endpoint_certificate_arn = optional(string)
            custom_endpoint_enabled         = optional(bool)
            enforce_https                   = optional(bool)
            tls_security_policy             = optional(string)
        })))
    ebs_options               = optional(list(object({
            ebs_enabled = bool
            iops        = optional(number)
            throughput  = optional(number)
            volume_size = optional(number)
            volume_type = optional(string)
        })))
    encrypt_at_rest           = optional(list(object({
            enabled    = bool
            kms_key_id = optional(string)
        })))
    log_publishing_options    = optional(set(object({
            cloudwatch_log_group_arn = string
            log_type                 = string
            enabled                  = optional(bool)
        })))
    node_to_node_encryption   = optional(list(object({
            enabled = bool
        })))
    snapshot_options          = optional(list(object({
            automated_snapshot_start_hour = number
        })))
    vpc_options               = optional(list(object({
            security_group_ids = optional(set(string))
            subnet_ids         = optional(set(string))
        })))
  }))
}
