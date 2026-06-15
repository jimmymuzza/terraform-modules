variable "container_groups" {
  description = <<EOT
Map of container_groups, attributes below
Required:
    - location
    - name
    - os_type
    - resource_group_name
    - container
Optional:
    - dns_name_label
    - dns_name_label_reuse_policy
    - exposed_port
    - ip_address_type
    - key_vault_key_id
    - key_vault_user_assigned_identity_id
    - network_profile_id
    - priority
    - restart_policy
    - sku
    - subnet_ids
    - tags
    - zones
    - diagnostics
    - dns_config
    - identity
    - image_registry_credential
    - init_container
EOT

  type = map(object({
    location                            = string
    name                                = string
    os_type                             = string
    resource_group_name                 = string
    dns_name_label                      = optional(string)
    dns_name_label_reuse_policy         = optional(string)
    exposed_port                        = optional(set(object({
            port = number
            protocol = string
        })))
    ip_address_type                     = optional(string)
    key_vault_key_id                    = optional(string)
    key_vault_user_assigned_identity_id = optional(string)
    network_profile_id                  = optional(string)
    priority                            = optional(string)
    restart_policy                      = optional(string)
    sku                                 = optional(string)
    subnet_ids                          = optional(set(string))
    tags                                = optional(map(string))
    zones                               = optional(set(string))
    container                           = list(object({
            cpu                          = number
            image                        = string
            memory                       = number
            name                         = string
            commands                     = optional(list(string))
            cpu_limit                    = optional(number)
            environment_variables        = optional(map(string))
            memory_limit                 = optional(number)
            secure_environment_variables = optional(map(string))
            liveness_probe               = optional(list(object({
                exec                  = optional(list(string))
                failure_threshold     = optional(number)
                initial_delay_seconds = optional(number)
                period_seconds        = optional(number)
                success_threshold     = optional(number)
                timeout_seconds       = optional(number)
                http_get              = optional(list(object({
                    http_headers = optional(map(string))
                    path         = optional(string)
                    port         = optional(number)
                    scheme       = optional(string)
                })))
            })))
            ports                        = optional(set(object({
                port     = optional(number)
                protocol = optional(string)
            })))
            readiness_probe              = optional(list(object({
                exec                  = optional(list(string))
                failure_threshold     = optional(number)
                initial_delay_seconds = optional(number)
                period_seconds        = optional(number)
                success_threshold     = optional(number)
                timeout_seconds       = optional(number)
                http_get              = optional(list(object({
                    http_headers = optional(map(string))
                    path         = optional(string)
                    port         = optional(number)
                    scheme       = optional(string)
                })))
            })))
            security                     = optional(list(object({
                privilege_enabled = bool
            })))
            volume                       = optional(list(object({
                mount_path           = string
                name                 = string
                empty_dir            = optional(bool)
                read_only            = optional(bool)
                secret               = optional(map(string))
                share_name           = optional(string)
                storage_account_key  = optional(string)
                storage_account_name = optional(string)
                git_repo             = optional(list(object({
                    url       = string
                    directory = optional(string)
                    revision  = optional(string)
                })))
            })))
        }))
    diagnostics                         = optional(list(object({
            log_analytics = list(object({
                workspace_id  = string
                workspace_key = string
                log_type      = optional(string)
                metadata      = optional(map(string))
            }))
        })))
    dns_config                          = optional(list(object({
            nameservers    = list(string)
            options        = optional(set(string))
            search_domains = optional(set(string))
        })))
    identity                            = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    image_registry_credential           = optional(list(object({
            server                    = string
            password                  = optional(string)
            user_assigned_identity_id = optional(string)
            username                  = optional(string)
        })))
    init_container                      = optional(list(object({
            image                        = string
            name                         = string
            commands                     = optional(list(string))
            environment_variables        = optional(map(string))
            secure_environment_variables = optional(map(string))
            security                     = optional(list(object({
                privilege_enabled = bool
            })))
            volume                       = optional(list(object({
                mount_path           = string
                name                 = string
                empty_dir            = optional(bool)
                read_only            = optional(bool)
                secret               = optional(map(string))
                share_name           = optional(string)
                storage_account_key  = optional(string)
                storage_account_name = optional(string)
                git_repo             = optional(list(object({
                    url       = string
                    directory = optional(string)
                    revision  = optional(string)
                })))
            })))
        })))
  }))
}
