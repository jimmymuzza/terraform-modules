resource "aws_ecs_daemon_task_definition" "ecs_daemon_task_definitions" {
  for_each = var.ecs_daemon_task_definitions

  family             = each.value.family
  cpu                = each.value.cpu
  execution_role_arn = each.value.execution_role_arn
  memory             = each.value.memory
  region             = each.value.region
  tags               = each.value.tags
  task_role_arn      = each.value.task_role_arn

  dynamic "container_definition" {
    for_each = each.value.container_definition != null ? each.value.container_definition : []
    content {
      image                    = container_definition.value.image
      command                  = container_definition.value.command
      cpu                      = container_definition.value.cpu
      entry_point              = container_definition.value.entry_point
      essential                = container_definition.value.essential
      interactive              = container_definition.value.interactive
      memory                   = container_definition.value.memory
      memory_reservation       = container_definition.value.memory_reservation
      name                     = container_definition.value.name
      privileged               = container_definition.value.privileged
      pseudo_terminal          = container_definition.value.pseudo_terminal
      readonly_root_filesystem = container_definition.value.readonly_root_filesystem
      start_timeout            = container_definition.value.start_timeout
      stop_timeout             = container_definition.value.stop_timeout
      user                     = container_definition.value.user
      working_directory        = container_definition.value.working_directory

      dynamic "depends_on" {
        for_each = container_definition.value.depends_on != null ? container_definition.value.depends_on : []
        content {
          condition      = depends_on.value.condition
          container_name = depends_on.value.container_name
        }
      }

      dynamic "environment" {
        for_each = container_definition.value.environment != null ? container_definition.value.environment : []
        content {
          name  = environment.value.name
          value = environment.value.value
        }
      }

      dynamic "environment_file" {
        for_each = container_definition.value.environment_file != null ? container_definition.value.environment_file : []
        content {
          type  = environment_file.value.type
          value = environment_file.value.value
        }
      }

      dynamic "firelens_configuration" {
        for_each = container_definition.value.firelens_configuration != null ? container_definition.value.firelens_configuration : []
        content {
          type    = firelens_configuration.value.type
          options = firelens_configuration.value.options
        }
      }

      dynamic "health_check" {
        for_each = container_definition.value.health_check != null ? container_definition.value.health_check : []
        content {
          command      = health_check.value.command
          interval     = health_check.value.interval
          retries      = health_check.value.retries
          start_period = health_check.value.start_period
          timeout      = health_check.value.timeout
        }
      }

      dynamic "linux_parameters" {
        for_each = container_definition.value.linux_parameters != null ? container_definition.value.linux_parameters : []
        content {
          init_process_enabled = linux_parameters.value.init_process_enabled

          dynamic "capabilities" {
            for_each = linux_parameters.value.capabilities != null ? linux_parameters.value.capabilities : []
            content {
              add  = capabilities.value.add
              drop = capabilities.value.drop
            }
          }

          dynamic "device" {
            for_each = linux_parameters.value.device != null ? linux_parameters.value.device : []
            content {
              host_path      = device.value.host_path
              container_path = device.value.container_path
              permissions    = device.value.permissions
            }
          }

          dynamic "tmpfs" {
            for_each = linux_parameters.value.tmpfs != null ? linux_parameters.value.tmpfs : []
            content {
              container_path = tmpfs.value.container_path
              size           = tmpfs.value.size
              mount_options  = tmpfs.value.mount_options
            }
          }
        }
      }

      dynamic "log_configuration" {
        for_each = container_definition.value.log_configuration != null ? container_definition.value.log_configuration : []
        content {
          log_driver = log_configuration.value.log_driver
          options    = log_configuration.value.options

          dynamic "secret_option" {
            for_each = log_configuration.value.secret_option != null ? log_configuration.value.secret_option : []
            content {
              name       = secret_option.value.name
              value_from = secret_option.value.value_from
            }
          }
        }
      }

      dynamic "mount_point" {
        for_each = container_definition.value.mount_point != null ? container_definition.value.mount_point : []
        content {
          container_path = mount_point.value.container_path
          read_only      = mount_point.value.read_only
          source_volume  = mount_point.value.source_volume
        }
      }

      dynamic "repository_credentials" {
        for_each = container_definition.value.repository_credentials != null ? container_definition.value.repository_credentials : []
        content {
          credentials_parameter = repository_credentials.value.credentials_parameter
        }
      }

      dynamic "restart_policy" {
        for_each = container_definition.value.restart_policy != null ? container_definition.value.restart_policy : []
        content {
          enabled                = restart_policy.value.enabled
          ignored_exit_codes     = restart_policy.value.ignored_exit_codes
          restart_attempt_period = restart_policy.value.restart_attempt_period
        }
      }

      dynamic "secret" {
        for_each = container_definition.value.secret != null ? container_definition.value.secret : []
        content {
          name       = secret.value.name
          value_from = secret.value.value_from
        }
      }

      dynamic "system_control" {
        for_each = container_definition.value.system_control != null ? container_definition.value.system_control : []
        content {
          namespace = system_control.value.namespace
          value     = system_control.value.value
        }
      }

      dynamic "ulimit" {
        for_each = container_definition.value.ulimit != null ? container_definition.value.ulimit : []
        content {
          hard_limit = ulimit.value.hard_limit
          name       = ulimit.value.name
          soft_limit = ulimit.value.soft_limit
        }
      }
    }
  }

  dynamic "volume" {
    for_each = each.value.volume != null ? each.value.volume : []
    content {
      name = volume.value.name

      dynamic "host" {
        for_each = volume.value.host != null ? volume.value.host : []
        content {
          source_path = host.value.source_path
        }
      }
    }
  }
}
