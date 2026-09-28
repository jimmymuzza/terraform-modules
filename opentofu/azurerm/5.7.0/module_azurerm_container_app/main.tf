resource "azurerm_container_app" "container_apps" {
  for_each = var.container_apps

  container_app_environment_id = each.value.container_app_environment_id
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  revision_mode                = each.value.revision_mode
  max_inactive_revisions       = each.value.max_inactive_revisions
  tags                         = each.value.tags
  workload_profile_name        = each.value.workload_profile_name

  dynamic "dapr" {
    for_each = each.value.dapr != null ? each.value.dapr : []
    content {
      app_id       = dapr.value.app_id
      app_port     = dapr.value.app_port
      app_protocol = dapr.value.app_protocol
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "ingress" {
    for_each = each.value.ingress != null ? each.value.ingress : []
    content {
      target_port                = ingress.value.target_port
      allow_insecure_connections = ingress.value.allow_insecure_connections
      client_certificate_mode    = ingress.value.client_certificate_mode
      exposed_port               = ingress.value.exposed_port
      external_enabled           = ingress.value.external_enabled
      transport                  = ingress.value.transport

      dynamic "cors" {
        for_each = ingress.value.cors != null ? ingress.value.cors : []
        content {
          allowed_origins           = cors.value.allowed_origins
          allow_credentials_enabled = cors.value.allow_credentials_enabled
          allowed_headers           = cors.value.allowed_headers
          allowed_methods           = cors.value.allowed_methods
          exposed_headers           = cors.value.exposed_headers
          max_age_in_seconds        = cors.value.max_age_in_seconds
        }
      }

      dynamic "ip_security_restriction" {
        for_each = ingress.value.ip_security_restriction != null ? ingress.value.ip_security_restriction : []
        content {
          action           = ip_security_restriction.value.action
          ip_address_range = ip_security_restriction.value.ip_address_range
          name             = ip_security_restriction.value.name
          description      = ip_security_restriction.value.description
        }
      }

      dynamic "traffic_weight" {
        for_each = ingress.value.traffic_weight != null ? ingress.value.traffic_weight : []
        content {
          percentage      = traffic_weight.value.percentage
          label           = traffic_weight.value.label
          latest_revision = traffic_weight.value.latest_revision
          revision_suffix = traffic_weight.value.revision_suffix
        }
      }
    }
  }

  dynamic "registry" {
    for_each = each.value.registry != null ? each.value.registry : []
    content {
      server               = registry.value.server
      identity             = registry.value.identity
      password_secret_name = registry.value.password_secret_name
      username             = registry.value.username
    }
  }

  dynamic "secret" {
    for_each = each.value.secret != null ? each.value.secret : []
    content {
      name                = secret.value.name
      identity            = secret.value.identity
      key_vault_secret_id = secret.value.key_vault_secret_id
      value               = secret.value.value
    }
  }

  dynamic "template" {
    for_each = each.value.template != null ? each.value.template : []
    content {
      cooldown_period_in_seconds       = template.value.cooldown_period_in_seconds
      max_replicas                     = template.value.max_replicas
      min_replicas                     = template.value.min_replicas
      polling_interval_in_seconds      = template.value.polling_interval_in_seconds
      revision_suffix                  = template.value.revision_suffix
      termination_grace_period_seconds = template.value.termination_grace_period_seconds

      dynamic "azure_queue_scale_rule" {
        for_each = template.value.azure_queue_scale_rule != null ? template.value.azure_queue_scale_rule : []
        content {
          name         = azure_queue_scale_rule.value.name
          queue_length = azure_queue_scale_rule.value.queue_length
          queue_name   = azure_queue_scale_rule.value.queue_name

          dynamic "authentication" {
            for_each = azure_queue_scale_rule.value.authentication != null ? azure_queue_scale_rule.value.authentication : []
            content {
              secret_name       = authentication.value.secret_name
              trigger_parameter = authentication.value.trigger_parameter
            }
          }
        }
      }

      dynamic "container" {
        for_each = template.value.container != null ? template.value.container : []
        content {
          cpu     = container.value.cpu
          image   = container.value.image
          memory  = container.value.memory
          name    = container.value.name
          args    = container.value.args
          command = container.value.command

          dynamic "env" {
            for_each = container.value.env != null ? container.value.env : []
            content {
              name        = env.value.name
              secret_name = env.value.secret_name
              value       = env.value.value
            }
          }

          dynamic "liveness_probe" {
            for_each = container.value.liveness_probe != null ? container.value.liveness_probe : []
            content {
              port                    = liveness_probe.value.port
              transport               = liveness_probe.value.transport
              failure_count_threshold = liveness_probe.value.failure_count_threshold
              host                    = liveness_probe.value.host
              initial_delay           = liveness_probe.value.initial_delay
              interval_seconds        = liveness_probe.value.interval_seconds
              path                    = liveness_probe.value.path
              timeout                 = liveness_probe.value.timeout

              dynamic "header" {
                for_each = liveness_probe.value.header != null ? liveness_probe.value.header : []
                content {
                  name  = header.value.name
                  value = header.value.value
                }
              }
            }
          }

          dynamic "readiness_probe" {
            for_each = container.value.readiness_probe != null ? container.value.readiness_probe : []
            content {
              port                    = readiness_probe.value.port
              transport               = readiness_probe.value.transport
              failure_count_threshold = readiness_probe.value.failure_count_threshold
              host                    = readiness_probe.value.host
              initial_delay           = readiness_probe.value.initial_delay
              interval_seconds        = readiness_probe.value.interval_seconds
              path                    = readiness_probe.value.path
              success_count_threshold = readiness_probe.value.success_count_threshold
              timeout                 = readiness_probe.value.timeout

              dynamic "header" {
                for_each = readiness_probe.value.header != null ? readiness_probe.value.header : []
                content {
                  name  = header.value.name
                  value = header.value.value
                }
              }
            }
          }

          dynamic "startup_probe" {
            for_each = container.value.startup_probe != null ? container.value.startup_probe : []
            content {
              port                    = startup_probe.value.port
              transport               = startup_probe.value.transport
              failure_count_threshold = startup_probe.value.failure_count_threshold
              host                    = startup_probe.value.host
              initial_delay           = startup_probe.value.initial_delay
              interval_seconds        = startup_probe.value.interval_seconds
              path                    = startup_probe.value.path
              timeout                 = startup_probe.value.timeout

              dynamic "header" {
                for_each = startup_probe.value.header != null ? startup_probe.value.header : []
                content {
                  name  = header.value.name
                  value = header.value.value
                }
              }
            }
          }

          dynamic "volume_mounts" {
            for_each = container.value.volume_mounts != null ? container.value.volume_mounts : []
            content {
              name     = volume_mounts.value.name
              path     = volume_mounts.value.path
              sub_path = volume_mounts.value.sub_path
            }
          }
        }
      }

      dynamic "custom_scale_rule" {
        for_each = template.value.custom_scale_rule != null ? template.value.custom_scale_rule : []
        content {
          custom_rule_type = custom_scale_rule.value.custom_rule_type
          metadata         = custom_scale_rule.value.metadata
          name             = custom_scale_rule.value.name
          identity_id      = custom_scale_rule.value.identity_id

          dynamic "authentication" {
            for_each = custom_scale_rule.value.authentication != null ? custom_scale_rule.value.authentication : []
            content {
              secret_name       = authentication.value.secret_name
              trigger_parameter = authentication.value.trigger_parameter
            }
          }
        }
      }

      dynamic "http_scale_rule" {
        for_each = template.value.http_scale_rule != null ? template.value.http_scale_rule : []
        content {
          concurrent_requests = http_scale_rule.value.concurrent_requests
          name                = http_scale_rule.value.name

          dynamic "authentication" {
            for_each = http_scale_rule.value.authentication != null ? http_scale_rule.value.authentication : []
            content {
              secret_name       = authentication.value.secret_name
              trigger_parameter = authentication.value.trigger_parameter
            }
          }
        }
      }

      dynamic "init_container" {
        for_each = template.value.init_container != null ? template.value.init_container : []
        content {
          image   = init_container.value.image
          name    = init_container.value.name
          args    = init_container.value.args
          command = init_container.value.command
          cpu     = init_container.value.cpu
          memory  = init_container.value.memory

          dynamic "env" {
            for_each = init_container.value.env != null ? init_container.value.env : []
            content {
              name        = env.value.name
              secret_name = env.value.secret_name
              value       = env.value.value
            }
          }

          dynamic "volume_mounts" {
            for_each = init_container.value.volume_mounts != null ? init_container.value.volume_mounts : []
            content {
              name     = volume_mounts.value.name
              path     = volume_mounts.value.path
              sub_path = volume_mounts.value.sub_path
            }
          }
        }
      }

      dynamic "tcp_scale_rule" {
        for_each = template.value.tcp_scale_rule != null ? template.value.tcp_scale_rule : []
        content {
          concurrent_requests = tcp_scale_rule.value.concurrent_requests
          name                = tcp_scale_rule.value.name

          dynamic "authentication" {
            for_each = tcp_scale_rule.value.authentication != null ? tcp_scale_rule.value.authentication : []
            content {
              secret_name       = authentication.value.secret_name
              trigger_parameter = authentication.value.trigger_parameter
            }
          }
        }
      }

      dynamic "volume" {
        for_each = template.value.volume != null ? template.value.volume : []
        content {
          name          = volume.value.name
          mount_options = volume.value.mount_options
          storage_name  = volume.value.storage_name
          storage_type  = volume.value.storage_type
        }
      }
    }
  }
}
