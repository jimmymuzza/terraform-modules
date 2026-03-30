variable "container_apps" {
  description = <<EOT
Map of container_apps, attributes below
Required:
    - container_app_environment_id
    - name
    - resource_group_name
    - revision_mode
    - template
Optional:
    - max_inactive_revisions
    - tags
    - workload_profile_name
    - dapr
    - identity
    - ingress
    - registry
    - secret
EOT

  type = map(object({
    container_app_environment_id = string
    name                         = string
    resource_group_name          = string
    revision_mode                = string
    max_inactive_revisions       = optional(number)
    tags                         = optional(map(string))
    workload_profile_name        = optional(string)
    dapr                         = optional(list(object({
            app_id       = string
            app_port     = optional(number)
            app_protocol = optional(string)
        })))
    identity                     = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    ingress                      = optional(list(object({
            target_port                = number
            allow_insecure_connections = optional(bool)
            client_certificate_mode    = optional(string)
            exposed_port               = optional(number)
            external_enabled           = optional(bool)
            transport                  = optional(string)
            cors                       = optional(list(object({
                allowed_origins           = list(string)
                allow_credentials_enabled = optional(bool)
                allowed_headers           = optional(list(string))
                allowed_methods           = optional(list(string))
                exposed_headers           = optional(list(string))
                max_age_in_seconds        = optional(number)
            })))
            ip_security_restriction    = optional(list(object({
                action           = string
                ip_address_range = string
                name             = string
                description      = optional(string)
            })))
            traffic_weight             = list(object({
                percentage      = number
                label           = optional(string)
                latest_revision = optional(bool)
                revision_suffix = optional(string)
            }))
        })))
    registry                     = optional(list(object({
            server               = string
            identity             = optional(string)
            password_secret_name = optional(string)
            username             = optional(string)
        })))
    secret                       = optional(set(object({
            name                = string
            identity            = optional(string)
            key_vault_secret_id = optional(string)
            value               = optional(string)
        })))
    template                     = list(object({
            cooldown_period_in_seconds       = optional(number)
            max_replicas                     = optional(number)
            min_replicas                     = optional(number)
            polling_interval_in_seconds      = optional(number)
            revision_suffix                  = optional(string)
            termination_grace_period_seconds = optional(number)
            azure_queue_scale_rule           = optional(list(object({
                name           = string
                queue_length   = number
                queue_name     = string
                authentication = list(object({
                    secret_name       = string
                    trigger_parameter = string
                }))
            })))
            container                        = list(object({
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
            custom_scale_rule                = optional(list(object({
                custom_rule_type = string
                metadata         = map(string)
                name             = string
                authentication   = optional(list(object({
                    secret_name       = string
                    trigger_parameter = string
                })))
            })))
            http_scale_rule                  = optional(list(object({
                concurrent_requests = string
                name                = string
                authentication      = optional(list(object({
                    secret_name       = string
                    trigger_parameter = optional(string)
                })))
            })))
            init_container                   = optional(list(object({
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
            tcp_scale_rule                   = optional(list(object({
                concurrent_requests = string
                name                = string
                authentication      = optional(list(object({
                    secret_name       = string
                    trigger_parameter = optional(string)
                })))
            })))
            volume                           = optional(list(object({
                name          = string
                mount_options = optional(string)
                storage_name  = optional(string)
                storage_type  = optional(string)
            })))
        }))
  }))
}
