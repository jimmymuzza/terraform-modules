resource "azurerm_container_group" "container_groups" {
  for_each = var.container_groups

  location                            = each.value.location
  name                                = each.value.name
  os_type                             = each.value.os_type
  resource_group_name                 = each.value.resource_group_name
  dns_name_label                      = each.value.dns_name_label
  dns_name_label_reuse_policy         = each.value.dns_name_label_reuse_policy
  exposed_port                        = each.value.exposed_port
  ip_address_type                     = each.value.ip_address_type
  key_vault_key_id                    = each.value.key_vault_key_id
  key_vault_user_assigned_identity_id = each.value.key_vault_user_assigned_identity_id
  network_profile_id                  = each.value.network_profile_id
  priority                            = each.value.priority
  restart_policy                      = each.value.restart_policy
  sku                                 = each.value.sku
  subnet_ids                          = each.value.subnet_ids
  tags                                = each.value.tags
  zones                               = each.value.zones

  dynamic "container" {
    for_each = each.value.container != null ? each.value.container : []
    content {
      cpu                          = container.value.cpu
      image                        = container.value.image
      memory                       = container.value.memory
      name                         = container.value.name
      commands                     = container.value.commands
      cpu_limit                    = container.value.cpu_limit
      environment_variables        = container.value.environment_variables
      memory_limit                 = container.value.memory_limit
      secure_environment_variables = container.value.secure_environment_variables

      dynamic "liveness_probe" {
        for_each = container.value.liveness_probe != null ? container.value.liveness_probe : []
        content {
          exec                  = liveness_probe.value.exec
          failure_threshold     = liveness_probe.value.failure_threshold
          initial_delay_seconds = liveness_probe.value.initial_delay_seconds
          period_seconds        = liveness_probe.value.period_seconds
          success_threshold     = liveness_probe.value.success_threshold
          timeout_seconds       = liveness_probe.value.timeout_seconds

          dynamic "http_get" {
            for_each = liveness_probe.value.http_get != null ? liveness_probe.value.http_get : []
            content {
              http_headers = http_get.value.http_headers
              path         = http_get.value.path
              port         = http_get.value.port
              scheme       = http_get.value.scheme
            }
          }
        }
      }

      dynamic "ports" {
        for_each = container.value.ports != null ? container.value.ports : []
        content {
          port     = ports.value.port
          protocol = ports.value.protocol
        }
      }

      dynamic "readiness_probe" {
        for_each = container.value.readiness_probe != null ? container.value.readiness_probe : []
        content {
          exec                  = readiness_probe.value.exec
          failure_threshold     = readiness_probe.value.failure_threshold
          initial_delay_seconds = readiness_probe.value.initial_delay_seconds
          period_seconds        = readiness_probe.value.period_seconds
          success_threshold     = readiness_probe.value.success_threshold
          timeout_seconds       = readiness_probe.value.timeout_seconds

          dynamic "http_get" {
            for_each = readiness_probe.value.http_get != null ? readiness_probe.value.http_get : []
            content {
              http_headers = http_get.value.http_headers
              path         = http_get.value.path
              port         = http_get.value.port
              scheme       = http_get.value.scheme
            }
          }
        }
      }

      dynamic "security" {
        for_each = container.value.security != null ? container.value.security : []
        content {
          privilege_enabled = security.value.privilege_enabled
        }
      }

      dynamic "volume" {
        for_each = container.value.volume != null ? container.value.volume : []
        content {
          mount_path           = volume.value.mount_path
          name                 = volume.value.name
          empty_dir            = volume.value.empty_dir
          read_only            = volume.value.read_only
          secret               = volume.value.secret
          share_name           = volume.value.share_name
          storage_account_key  = volume.value.storage_account_key
          storage_account_name = volume.value.storage_account_name

          dynamic "git_repo" {
            for_each = volume.value.git_repo != null ? volume.value.git_repo : []
            content {
              url       = git_repo.value.url
              directory = git_repo.value.directory
              revision  = git_repo.value.revision
            }
          }
        }
      }
    }
  }

  dynamic "diagnostics" {
    for_each = each.value.diagnostics != null ? each.value.diagnostics : []
    content {

      dynamic "log_analytics" {
        for_each = diagnostics.value.log_analytics != null ? diagnostics.value.log_analytics : []
        content {
          workspace_id  = log_analytics.value.workspace_id
          workspace_key = log_analytics.value.workspace_key
          log_type      = log_analytics.value.log_type
          metadata      = log_analytics.value.metadata
        }
      }
    }
  }

  dynamic "dns_config" {
    for_each = each.value.dns_config != null ? each.value.dns_config : []
    content {
      nameservers    = dns_config.value.nameservers
      options        = dns_config.value.options
      search_domains = dns_config.value.search_domains
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "image_registry_credential" {
    for_each = each.value.image_registry_credential != null ? each.value.image_registry_credential : []
    content {
      server                    = image_registry_credential.value.server
      password                  = image_registry_credential.value.password
      user_assigned_identity_id = image_registry_credential.value.user_assigned_identity_id
      username                  = image_registry_credential.value.username
    }
  }

  dynamic "init_container" {
    for_each = each.value.init_container != null ? each.value.init_container : []
    content {
      image                        = init_container.value.image
      name                         = init_container.value.name
      commands                     = init_container.value.commands
      environment_variables        = init_container.value.environment_variables
      secure_environment_variables = init_container.value.secure_environment_variables

      dynamic "security" {
        for_each = init_container.value.security != null ? init_container.value.security : []
        content {
          privilege_enabled = security.value.privilege_enabled
        }
      }

      dynamic "volume" {
        for_each = init_container.value.volume != null ? init_container.value.volume : []
        content {
          mount_path           = volume.value.mount_path
          name                 = volume.value.name
          empty_dir            = volume.value.empty_dir
          read_only            = volume.value.read_only
          secret               = volume.value.secret
          share_name           = volume.value.share_name
          storage_account_key  = volume.value.storage_account_key
          storage_account_name = volume.value.storage_account_name

          dynamic "git_repo" {
            for_each = volume.value.git_repo != null ? volume.value.git_repo : []
            content {
              url       = git_repo.value.url
              directory = git_repo.value.directory
              revision  = git_repo.value.revision
            }
          }
        }
      }
    }
  }
}
