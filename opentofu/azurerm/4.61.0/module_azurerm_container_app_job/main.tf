resource "azurerm_container_app_job" "container_app_jobs" {
  for_each = var.container_app_jobs

  container_app_environment_id = each.value.container_app_environment_id
  location                     = each.value.location
  name                         = each.value.name
  replica_timeout_in_seconds   = each.value.replica_timeout_in_seconds
  resource_group_name          = each.value.resource_group_name
  replica_retry_limit          = each.value.replica_retry_limit
  tags                         = each.value.tags
  workload_profile_name        = each.value.workload_profile_name

  dynamic "event_trigger_config" {
    for_each = each.value.event_trigger_config != null ? each.value.event_trigger_config : []
    content {
      parallelism              = event_trigger_config.value.parallelism
      replica_completion_count = event_trigger_config.value.replica_completion_count

      dynamic "scale" {
        for_each = event_trigger_config.value.scale != null ? event_trigger_config.value.scale : []
        content {
          max_executions              = scale.value.max_executions
          min_executions              = scale.value.min_executions
          polling_interval_in_seconds = scale.value.polling_interval_in_seconds

          dynamic "rules" {
            for_each = scale.value.rules != null ? scale.value.rules : []
            content {
              custom_rule_type = rules.value.custom_rule_type
              metadata         = rules.value.metadata
              name             = rules.value.name

              dynamic "authentication" {
                for_each = rules.value.authentication != null ? rules.value.authentication : []
                content {
                  secret_name       = authentication.value.secret_name
                  trigger_parameter = authentication.value.trigger_parameter
                }
              }
            }
          }
        }
      }
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "manual_trigger_config" {
    for_each = each.value.manual_trigger_config != null ? each.value.manual_trigger_config : []
    content {
      parallelism              = manual_trigger_config.value.parallelism
      replica_completion_count = manual_trigger_config.value.replica_completion_count
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

  dynamic "schedule_trigger_config" {
    for_each = each.value.schedule_trigger_config != null ? each.value.schedule_trigger_config : []
    content {
      cron_expression          = schedule_trigger_config.value.cron_expression
      parallelism              = schedule_trigger_config.value.parallelism
      replica_completion_count = schedule_trigger_config.value.replica_completion_count
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
