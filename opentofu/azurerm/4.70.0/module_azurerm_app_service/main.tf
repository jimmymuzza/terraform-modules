resource "azurerm_app_service" "app_services" {
  for_each = var.app_services

  app_service_plan_id             = each.value.app_service_plan_id
  location                        = each.value.location
  name                            = each.value.name
  resource_group_name             = each.value.resource_group_name
  app_settings                    = each.value.app_settings
  client_affinity_enabled         = each.value.client_affinity_enabled
  client_cert_enabled             = each.value.client_cert_enabled
  client_cert_mode                = each.value.client_cert_mode
  enabled                         = each.value.enabled
  https_only                      = each.value.https_only
  key_vault_reference_identity_id = each.value.key_vault_reference_identity_id
  tags                            = each.value.tags

  dynamic "auth_settings" {
    for_each = each.value.auth_settings != null ? each.value.auth_settings : []
    content {
      enabled                        = auth_settings.value.enabled
      additional_login_params        = auth_settings.value.additional_login_params
      allowed_external_redirect_urls = auth_settings.value.allowed_external_redirect_urls
      default_provider               = auth_settings.value.default_provider
      issuer                         = auth_settings.value.issuer
      runtime_version                = auth_settings.value.runtime_version
      token_refresh_extension_hours  = auth_settings.value.token_refresh_extension_hours
      token_store_enabled            = auth_settings.value.token_store_enabled
      unauthenticated_client_action  = auth_settings.value.unauthenticated_client_action

      dynamic "active_directory" {
        for_each = auth_settings.value.active_directory != null ? auth_settings.value.active_directory : []
        content {
          client_id         = active_directory.value.client_id
          allowed_audiences = active_directory.value.allowed_audiences
          client_secret     = active_directory.value.client_secret
        }
      }

      dynamic "facebook" {
        for_each = auth_settings.value.facebook != null ? auth_settings.value.facebook : []
        content {
          app_id       = facebook.value.app_id
          app_secret   = facebook.value.app_secret
          oauth_scopes = facebook.value.oauth_scopes
        }
      }

      dynamic "google" {
        for_each = auth_settings.value.google != null ? auth_settings.value.google : []
        content {
          client_id     = google.value.client_id
          client_secret = google.value.client_secret
          oauth_scopes  = google.value.oauth_scopes
        }
      }

      dynamic "microsoft" {
        for_each = auth_settings.value.microsoft != null ? auth_settings.value.microsoft : []
        content {
          client_id     = microsoft.value.client_id
          client_secret = microsoft.value.client_secret
          oauth_scopes  = microsoft.value.oauth_scopes
        }
      }

      dynamic "twitter" {
        for_each = auth_settings.value.twitter != null ? auth_settings.value.twitter : []
        content {
          consumer_key    = twitter.value.consumer_key
          consumer_secret = twitter.value.consumer_secret
        }
      }
    }
  }

  dynamic "backup" {
    for_each = each.value.backup != null ? each.value.backup : []
    content {
      name                = backup.value.name
      storage_account_url = backup.value.storage_account_url
      enabled             = backup.value.enabled

      dynamic "schedule" {
        for_each = backup.value.schedule != null ? backup.value.schedule : []
        content {
          frequency_interval       = schedule.value.frequency_interval
          frequency_unit           = schedule.value.frequency_unit
          keep_at_least_one_backup = schedule.value.keep_at_least_one_backup
          retention_period_in_days = schedule.value.retention_period_in_days
          start_time               = schedule.value.start_time
        }
      }
    }
  }

  dynamic "connection_string" {
    for_each = each.value.connection_string != null ? each.value.connection_string : []
    content {
      name  = connection_string.value.name
      type  = connection_string.value.type
      value = connection_string.value.value
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "logs" {
    for_each = each.value.logs != null ? each.value.logs : []
    content {
      detailed_error_messages_enabled = logs.value.detailed_error_messages_enabled
      failed_request_tracing_enabled  = logs.value.failed_request_tracing_enabled

      dynamic "application_logs" {
        for_each = logs.value.application_logs != null ? logs.value.application_logs : []
        content {
          file_system_level = application_logs.value.file_system_level

          dynamic "azure_blob_storage" {
            for_each = application_logs.value.azure_blob_storage != null ? application_logs.value.azure_blob_storage : []
            content {
              level             = azure_blob_storage.value.level
              retention_in_days = azure_blob_storage.value.retention_in_days
              sas_url           = azure_blob_storage.value.sas_url
            }
          }
        }
      }

      dynamic "http_logs" {
        for_each = logs.value.http_logs != null ? logs.value.http_logs : []
        content {

          dynamic "azure_blob_storage" {
            for_each = http_logs.value.azure_blob_storage != null ? http_logs.value.azure_blob_storage : []
            content {
              retention_in_days = azure_blob_storage.value.retention_in_days
              sas_url           = azure_blob_storage.value.sas_url
            }
          }

          dynamic "file_system" {
            for_each = http_logs.value.file_system != null ? http_logs.value.file_system : []
            content {
              retention_in_days = file_system.value.retention_in_days
              retention_in_mb   = file_system.value.retention_in_mb
            }
          }
        }
      }
    }
  }

  dynamic "site_config" {
    for_each = each.value.site_config != null ? each.value.site_config : []
    content {
      acr_use_managed_identity_credentials = site_config.value.acr_use_managed_identity_credentials
      acr_user_managed_identity_client_id  = site_config.value.acr_user_managed_identity_client_id
      always_on                            = site_config.value.always_on
      app_command_line                     = site_config.value.app_command_line
      auto_swap_slot_name                  = site_config.value.auto_swap_slot_name
      default_documents                    = site_config.value.default_documents
      dotnet_framework_version             = site_config.value.dotnet_framework_version
      ftps_state                           = site_config.value.ftps_state
      health_check_path                    = site_config.value.health_check_path
      http2_enabled                        = site_config.value.http2_enabled
      ip_restriction                       = site_config.value.ip_restriction
      java_container                       = site_config.value.java_container
      java_container_version               = site_config.value.java_container_version
      java_version                         = site_config.value.java_version
      linux_fx_version                     = site_config.value.linux_fx_version
      local_mysql_enabled                  = site_config.value.local_mysql_enabled
      managed_pipeline_mode                = site_config.value.managed_pipeline_mode
      min_tls_version                      = site_config.value.min_tls_version
      number_of_workers                    = site_config.value.number_of_workers
      php_version                          = site_config.value.php_version
      python_version                       = site_config.value.python_version
      remote_debugging_enabled             = site_config.value.remote_debugging_enabled
      remote_debugging_version             = site_config.value.remote_debugging_version
      scm_ip_restriction                   = site_config.value.scm_ip_restriction
      scm_type                             = site_config.value.scm_type
      scm_use_main_ip_restriction          = site_config.value.scm_use_main_ip_restriction
      use_32_bit_worker_process            = site_config.value.use_32_bit_worker_process
      vnet_route_all_enabled               = site_config.value.vnet_route_all_enabled
      websockets_enabled                   = site_config.value.websockets_enabled
      windows_fx_version                   = site_config.value.windows_fx_version

      dynamic "cors" {
        for_each = site_config.value.cors != null ? site_config.value.cors : []
        content {
          allowed_origins     = cors.value.allowed_origins
          support_credentials = cors.value.support_credentials
        }
      }
    }
  }

  dynamic "source_control" {
    for_each = each.value.source_control != null ? each.value.source_control : []
    content {
      branch             = source_control.value.branch
      manual_integration = source_control.value.manual_integration
      repo_url           = source_control.value.repo_url
      rollback_enabled   = source_control.value.rollback_enabled
      use_mercurial      = source_control.value.use_mercurial
    }
  }

  dynamic "storage_account" {
    for_each = each.value.storage_account != null ? each.value.storage_account : []
    content {
      access_key   = storage_account.value.access_key
      account_name = storage_account.value.account_name
      name         = storage_account.value.name
      share_name   = storage_account.value.share_name
      type         = storage_account.value.type
      mount_path   = storage_account.value.mount_path
    }
  }
}
