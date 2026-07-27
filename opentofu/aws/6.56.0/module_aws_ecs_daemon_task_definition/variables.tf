variable "ecs_daemon_task_definitions" {
  description = <<EOT
Map of ecs_daemon_task_definitions, attributes below
Required:
    - family
Optional:
    - cpu
    - execution_role_arn
    - memory
    - region
    - tags
    - task_role_arn
    - container_definition
    - volume
EOT

  type = map(object({
    family               = string
    cpu                  = optional(string)
    execution_role_arn   = optional(string)
    memory               = optional(string)
    region               = optional(string)
    tags                 = optional(map(string))
    task_role_arn        = optional(string)
    container_definition = optional(list(object({
            image                    = string
            command                  = optional(list(string))
            cpu                      = optional(number)
            entry_point              = optional(list(string))
            essential                = optional(bool)
            interactive              = optional(bool)
            memory                   = optional(number)
            memory_reservation       = optional(number)
            name                     = optional(string)
            privileged               = optional(bool)
            pseudo_terminal          = optional(bool)
            readonly_root_filesystem = optional(bool)
            start_timeout            = optional(number)
            stop_timeout             = optional(number)
            user                     = optional(string)
            working_directory        = optional(string)
            depends_on               = optional(list(object({
                condition      = string
                container_name = string
            })))
            environment              = optional(set(object({
                name  = optional(string)
                value = optional(string)
            })))
            environment_file         = optional(list(object({
                type  = string
                value = string
            })))
            firelens_configuration   = optional(list(object({
                type    = string
                options = optional(map(string))
            })))
            health_check             = optional(list(object({
                command      = list(string)
                interval     = optional(number)
                retries      = optional(number)
                start_period = optional(number)
                timeout      = optional(number)
            })))
            linux_parameters         = optional(list(object({
                init_process_enabled = optional(bool)
                capabilities         = optional(list(object({
                    add  = optional(list(string))
                    drop = optional(list(string))
                })))
                device               = optional(list(object({
                    host_path      = string
                    container_path = optional(string)
                    permissions    = optional(list(string))
                })))
                tmpfs                = optional(list(object({
                    container_path = string
                    size           = number
                    mount_options  = optional(list(string))
                })))
            })))
            log_configuration        = optional(list(object({
                log_driver    = string
                options       = optional(map(string))
                secret_option = optional(list(object({
                    name       = string
                    value_from = string
                })))
            })))
            mount_point              = optional(list(object({
                container_path = optional(string)
                read_only      = optional(bool)
                source_volume  = optional(string)
            })))
            repository_credentials   = optional(list(object({
                credentials_parameter = string
            })))
            restart_policy           = optional(list(object({
                enabled                = bool
                ignored_exit_codes     = optional(list(number))
                restart_attempt_period = optional(number)
            })))
            secret                   = optional(list(object({
                name       = string
                value_from = string
            })))
            system_control           = optional(list(object({
                namespace = optional(string)
                value     = optional(string)
            })))
            ulimit                   = optional(list(object({
                hard_limit = number
                name       = string
                soft_limit = number
            })))
        })))
    volume               = optional(set(object({
            name = string
            host = optional(list(object({
                source_path = optional(string)
            })))
        })))
  }))
}
