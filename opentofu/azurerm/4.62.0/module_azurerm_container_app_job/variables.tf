variable "container_app_jobs" {
  description = <<EOT
Map of container_app_jobs, attributes below
Required:
    - container_app_environment_id
    - location
    - name
    - replica_timeout_in_seconds
    - resource_group_name
    - template
Optional:
    - replica_retry_limit
    - tags
    - workload_profile_name
    - event_trigger_config
    - identity
    - manual_trigger_config
    - registry
    - schedule_trigger_config
    - secret
EOT

  type = map(object({
    container_app_environment_id = string
    location                     = string
    name                         = string
    replica_timeout_in_seconds   = number
    resource_group_name          = string
    replica_retry_limit          = optional(number)
    tags                         = optional(map(string))
    workload_profile_name        = optional(string)
    event_trigger_config         = optional(list(object({
            parallelism              = optional(number)
            replica_completion_count = optional(number)
            scale                    = optional(list(object({
                max_executions              = optional(number)
                min_executions              = optional(number)
                polling_interval_in_seconds = optional(number)
                rules                       = optional(list(object({
                    custom_rule_type = string
                    metadata         = map(string)
                    name             = string
                    authentication   = optional(list(object({
                        secret_name       = string
                        trigger_parameter = string
                    })))
                })))
            })))
        })))
    identity                     = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    manual_trigger_config        = optional(list(object({
            parallelism              = optional(number)
            replica_completion_count = optional(number)
        })))
    registry                     = optional(list(object({
            server               = string
            identity             = optional(string)
            password_secret_name = optional(string)
            username             = optional(string)
        })))
    schedule_trigger_config      = optional(list(object({
            cron_expression          = string
            parallelism              = optional(number)
            replica_completion_count = optional(number)
        })))
    secret                       = optional(set(object({
            name                = string
            identity            = optional(string)
            key_vault_secret_id = optional(string)
            value               = optional(string)
        })))
    template                     = list(object({
            container      = list(object({
                cpu             = number
                image           = string
                memory          = string
                name            = string
                args            = optional(list(string))
                command         = optional(list(string))
                env             = optional(list(object({
                    name        = string
                    secret_name = optional(string)
                    value       = optional(string)
                })))
                liveness_probe  = optional(list(object({
                    port                    = number
                    transport               = string
                    failure_count_threshold = optional(number)
                    host                    = optional(string)
                    initial_delay           = optional(number)
                    interval_seconds        = optional(number)
                    path                    = optional(string)
                    timeout                 = optional(number)
                    header                  = optional(list(object({
                        name  = string
                        value = string
                    })))
                })))
                readiness_probe = optional(list(object({
                    port                    = number
                    transport               = string
                    failure_count_threshold = optional(number)
                    host                    = optional(string)
                    initial_delay           = optional(number)
                    interval_seconds        = optional(number)
                    path                    = optional(string)
                    success_count_threshold = optional(number)
                    timeout                 = optional(number)
                    header                  = optional(list(object({
                        name  = string
                        value = string
                    })))
                })))
                startup_probe   = optional(list(object({
                    port                    = number
                    transport               = string
                    failure_count_threshold = optional(number)
                    host                    = optional(string)
                    initial_delay           = optional(number)
                    interval_seconds        = optional(number)
                    path                    = optional(string)
                    timeout                 = optional(number)
                    header                  = optional(list(object({
                        name  = string
                        value = string
                    })))
                })))
                volume_mounts   = optional(list(object({
                    name     = string
                    path     = string
                    sub_path = optional(string)
                })))
            }))
            init_container = optional(list(object({
                image         = string
                name          = string
                args          = optional(list(string))
                command       = optional(list(string))
                cpu           = optional(number)
                memory        = optional(string)
                env           = optional(list(object({
                    name        = string
                    secret_name = optional(string)
                    value       = optional(string)
                })))
                volume_mounts = optional(list(object({
                    name     = string
                    path     = string
                    sub_path = optional(string)
                })))
            })))
            volume         = optional(list(object({
                name          = string
                mount_options = optional(string)
                storage_name  = optional(string)
                storage_type  = optional(string)
            })))
        }))
  }))
}
