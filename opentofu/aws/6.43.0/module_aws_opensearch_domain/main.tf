resource "aws_opensearch_domain" "opensearch_domains" {
  for_each = var.opensearch_domains

  domain_name      = each.value.domain_name
  access_policies  = each.value.access_policies
  advanced_options = each.value.advanced_options
  engine_version   = each.value.engine_version
  ip_address_type  = each.value.ip_address_type
  region           = each.value.region
  tags             = each.value.tags
  tags_all         = each.value.tags_all

  dynamic "advanced_security_options" {
    for_each = each.value.advanced_security_options != null ? each.value.advanced_security_options : []
    content {
      enabled                        = advanced_security_options.value.enabled
      anonymous_auth_enabled         = advanced_security_options.value.anonymous_auth_enabled
      internal_user_database_enabled = advanced_security_options.value.internal_user_database_enabled

      dynamic "jwt_options" {
        for_each = advanced_security_options.value.jwt_options != null ? advanced_security_options.value.jwt_options : []
        content {
          enabled     = jwt_options.value.enabled
          public_key  = jwt_options.value.public_key
          roles_key   = jwt_options.value.roles_key
          subject_key = jwt_options.value.subject_key
        }
      }

      dynamic "master_user_options" {
        for_each = advanced_security_options.value.master_user_options != null ? advanced_security_options.value.master_user_options : []
        content {
          master_user_arn      = master_user_options.value.master_user_arn
          master_user_name     = master_user_options.value.master_user_name
          master_user_password = master_user_options.value.master_user_password
        }
      }
    }
  }

  dynamic "aiml_options" {
    for_each = each.value.aiml_options != null ? each.value.aiml_options : []
    content {

      dynamic "natural_language_query_generation_options" {
        for_each = aiml_options.value.natural_language_query_generation_options != null ? aiml_options.value.natural_language_query_generation_options : []
        content {
          desired_state = natural_language_query_generation_options.value.desired_state
        }
      }

      dynamic "s3_vectors_engine" {
        for_each = aiml_options.value.s3_vectors_engine != null ? aiml_options.value.s3_vectors_engine : []
        content {
          enabled = s3_vectors_engine.value.enabled
        }
      }

      dynamic "serverless_vector_acceleration" {
        for_each = aiml_options.value.serverless_vector_acceleration != null ? aiml_options.value.serverless_vector_acceleration : []
        content {
          enabled = serverless_vector_acceleration.value.enabled
        }
      }
    }
  }

  dynamic "auto_tune_options" {
    for_each = each.value.auto_tune_options != null ? each.value.auto_tune_options : []
    content {
      desired_state       = auto_tune_options.value.desired_state
      rollback_on_disable = auto_tune_options.value.rollback_on_disable
      use_off_peak_window = auto_tune_options.value.use_off_peak_window

      dynamic "maintenance_schedule" {
        for_each = auto_tune_options.value.maintenance_schedule != null ? auto_tune_options.value.maintenance_schedule : []
        content {
          cron_expression_for_recurrence = maintenance_schedule.value.cron_expression_for_recurrence
          start_at                       = maintenance_schedule.value.start_at

          dynamic "duration" {
            for_each = maintenance_schedule.value.duration != null ? maintenance_schedule.value.duration : []
            content {
              unit  = duration.value.unit
              value = duration.value.value
            }
          }
        }
      }
    }
  }

  dynamic "cluster_config" {
    for_each = each.value.cluster_config != null ? each.value.cluster_config : []
    content {
      dedicated_master_count        = cluster_config.value.dedicated_master_count
      dedicated_master_enabled      = cluster_config.value.dedicated_master_enabled
      dedicated_master_type         = cluster_config.value.dedicated_master_type
      instance_count                = cluster_config.value.instance_count
      instance_type                 = cluster_config.value.instance_type
      multi_az_with_standby_enabled = cluster_config.value.multi_az_with_standby_enabled
      warm_count                    = cluster_config.value.warm_count
      warm_enabled                  = cluster_config.value.warm_enabled
      warm_type                     = cluster_config.value.warm_type
      zone_awareness_enabled        = cluster_config.value.zone_awareness_enabled

      dynamic "cold_storage_options" {
        for_each = cluster_config.value.cold_storage_options != null ? cluster_config.value.cold_storage_options : []
        content {
          enabled = cold_storage_options.value.enabled
        }
      }

      dynamic "node_options" {
        for_each = cluster_config.value.node_options != null ? cluster_config.value.node_options : []
        content {
          node_type = node_options.value.node_type

          dynamic "node_config" {
            for_each = node_options.value.node_config != null ? node_options.value.node_config : []
            content {
              count   = node_config.value.count
              enabled = node_config.value.enabled
              type    = node_config.value.type
            }
          }
        }
      }

      dynamic "zone_awareness_config" {
        for_each = cluster_config.value.zone_awareness_config != null ? cluster_config.value.zone_awareness_config : []
        content {
          availability_zone_count = zone_awareness_config.value.availability_zone_count
        }
      }
    }
  }

  dynamic "cognito_options" {
    for_each = each.value.cognito_options != null ? each.value.cognito_options : []
    content {
      identity_pool_id = cognito_options.value.identity_pool_id
      role_arn         = cognito_options.value.role_arn
      user_pool_id     = cognito_options.value.user_pool_id
      enabled          = cognito_options.value.enabled
    }
  }

  dynamic "deployment_strategy_options" {
    for_each = each.value.deployment_strategy_options != null ? each.value.deployment_strategy_options : []
    content {
      deployment_strategy = deployment_strategy_options.value.deployment_strategy
    }
  }

  dynamic "domain_endpoint_options" {
    for_each = each.value.domain_endpoint_options != null ? each.value.domain_endpoint_options : []
    content {
      custom_endpoint                 = domain_endpoint_options.value.custom_endpoint
      custom_endpoint_certificate_arn = domain_endpoint_options.value.custom_endpoint_certificate_arn
      custom_endpoint_enabled         = domain_endpoint_options.value.custom_endpoint_enabled
      enforce_https                   = domain_endpoint_options.value.enforce_https
      tls_security_policy             = domain_endpoint_options.value.tls_security_policy
    }
  }

  dynamic "ebs_options" {
    for_each = each.value.ebs_options != null ? each.value.ebs_options : []
    content {
      ebs_enabled = ebs_options.value.ebs_enabled
      iops        = ebs_options.value.iops
      throughput  = ebs_options.value.throughput
      volume_size = ebs_options.value.volume_size
      volume_type = ebs_options.value.volume_type
    }
  }

  dynamic "encrypt_at_rest" {
    for_each = each.value.encrypt_at_rest != null ? each.value.encrypt_at_rest : []
    content {
      enabled    = encrypt_at_rest.value.enabled
      kms_key_id = encrypt_at_rest.value.kms_key_id
    }
  }

  dynamic "identity_center_options" {
    for_each = each.value.identity_center_options != null ? each.value.identity_center_options : []
    content {
      enabled_api_access           = identity_center_options.value.enabled_api_access
      identity_center_instance_arn = identity_center_options.value.identity_center_instance_arn
      roles_key                    = identity_center_options.value.roles_key
      subject_key                  = identity_center_options.value.subject_key
    }
  }

  dynamic "log_publishing_options" {
    for_each = each.value.log_publishing_options != null ? each.value.log_publishing_options : []
    content {
      cloudwatch_log_group_arn = log_publishing_options.value.cloudwatch_log_group_arn
      log_type                 = log_publishing_options.value.log_type
      enabled                  = log_publishing_options.value.enabled
    }
  }

  dynamic "node_to_node_encryption" {
    for_each = each.value.node_to_node_encryption != null ? each.value.node_to_node_encryption : []
    content {
      enabled = node_to_node_encryption.value.enabled
    }
  }

  dynamic "off_peak_window_options" {
    for_each = each.value.off_peak_window_options != null ? each.value.off_peak_window_options : []
    content {
      enabled = off_peak_window_options.value.enabled

      dynamic "off_peak_window" {
        for_each = off_peak_window_options.value.off_peak_window != null ? off_peak_window_options.value.off_peak_window : []
        content {

          dynamic "window_start_time" {
            for_each = off_peak_window.value.window_start_time != null ? off_peak_window.value.window_start_time : []
            content {
              hours   = window_start_time.value.hours
              minutes = window_start_time.value.minutes
            }
          }
        }
      }
    }
  }

  dynamic "snapshot_options" {
    for_each = each.value.snapshot_options != null ? each.value.snapshot_options : []
    content {
      automated_snapshot_start_hour = snapshot_options.value.automated_snapshot_start_hour
    }
  }

  dynamic "software_update_options" {
    for_each = each.value.software_update_options != null ? each.value.software_update_options : []
    content {
      auto_software_update_enabled = software_update_options.value.auto_software_update_enabled
    }
  }

  dynamic "vpc_options" {
    for_each = each.value.vpc_options != null ? each.value.vpc_options : []
    content {
      security_group_ids = vpc_options.value.security_group_ids
      subnet_ids         = vpc_options.value.subnet_ids
    }
  }
}
