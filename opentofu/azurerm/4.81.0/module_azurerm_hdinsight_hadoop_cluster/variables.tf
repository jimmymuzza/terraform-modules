variable "hdinsight_hadoop_clusters" {
  description = <<EOT
Map of hdinsight_hadoop_clusters, attributes below
Required:
    - cluster_version
    - location
    - name
    - resource_group_name
    - tier
    - component_version
    - gateway
    - roles
Optional:
    - tags
    - tls_min_version
    - compute_isolation
    - disk_encryption
    - extension
    - metastores
    - monitor
    - network
    - private_link_configuration
    - security_profile
    - storage_account
    - storage_account_gen2
EOT

  type = map(object({
    cluster_version            = string
    location                   = string
    name                       = string
    resource_group_name        = string
    tier                       = string
    tags                       = optional(map(string))
    tls_min_version            = optional(string)
    component_version          = list(object({
            hadoop = string
        }))
    compute_isolation          = optional(list(object({
            compute_isolation_enabled = optional(bool)
            host_sku                  = optional(string)
        })))
    disk_encryption            = optional(list(object({
            encryption_algorithm          = optional(string)
            encryption_at_host_enabled    = optional(bool)
            key_vault_key_id              = optional(string)
            key_vault_managed_identity_id = optional(string)
        })))
    extension                  = optional(list(object({
            log_analytics_workspace_id = string
            primary_key                = string
        })))
    gateway                    = list(object({
            password = string
            username = string
        }))
    metastores                 = optional(list(object({
            ambari = optional(list(object({
                database_name = string
                password      = string
                server        = string
                username      = string
            })))
            hive   = optional(list(object({
                database_name = string
                password      = string
                server        = string
                username      = string
            })))
            oozie  = optional(list(object({
                database_name = string
                password      = string
                server        = string
                username      = string
            })))
        })))
    monitor                    = optional(list(object({
            log_analytics_workspace_id = string
            primary_key                = string
        })))
    network                    = optional(list(object({
            connection_direction = optional(string)
            private_link_enabled = optional(bool)
        })))
    private_link_configuration = optional(list(object({
            group_id         = string
            name             = string
            ip_configuration = list(object({
                name                         = string
                primary                      = optional(bool)
                private_ip_address           = optional(string)
                private_ip_allocation_method = optional(string)
                subnet_id                    = optional(string)
            }))
        })))
    roles                      = list(object({
            edge_node      = optional(list(object({
                target_instance_count    = number
                vm_size                  = string
                https_endpoints          = optional(list(object({
                    access_modes         = optional(list(string))
                    destination_port     = optional(number)
                    disable_gateway_auth = optional(bool)
                    private_ip_address   = optional(string)
                    sub_domain_suffix    = optional(string)
                })))
                install_script_action    = list(object({
                    name       = string
                    uri        = string
                    parameters = optional(string)
                }))
                uninstall_script_actions = optional(list(object({
                    name       = string
                    uri        = string
                    parameters = optional(string)
                })))
            })))
            head_node      = list(object({
                username           = string
                vm_size            = string
                password           = optional(string)
                ssh_keys           = optional(set(string))
                subnet_id          = optional(string)
                virtual_network_id = optional(string)
                script_actions     = optional(list(object({
                    name       = string
                    uri        = string
                    parameters = optional(string)
                })))
            }))
            worker_node    = list(object({
                target_instance_count = number
                username              = string
                vm_size               = string
                password              = optional(string)
                ssh_keys              = optional(set(string))
                subnet_id             = optional(string)
                virtual_network_id    = optional(string)
                autoscale             = optional(list(object({
                    capacity   = optional(list(object({
                        max_instance_count = number
                        min_instance_count = number
                    })))
                    recurrence = optional(list(object({
                        timezone = string
                        schedule = list(object({
                            days                  = list(string)
                            target_instance_count = number
                            time                  = string
                        }))
                    })))
                })))
                script_actions        = optional(list(object({
                    name       = string
                    uri        = string
                    parameters = optional(string)
                })))
            }))
            zookeeper_node = list(object({
                username           = string
                vm_size            = string
                password           = optional(string)
                ssh_keys           = optional(set(string))
                subnet_id          = optional(string)
                virtual_network_id = optional(string)
                script_actions     = optional(list(object({
                    name       = string
                    uri        = string
                    parameters = optional(string)
                })))
            }))
        }))
    security_profile           = optional(list(object({
            aadds_resource_id       = string
            domain_name             = string
            domain_user_password    = string
            domain_username         = string
            ldaps_urls              = set(string)
            msi_resource_id         = string
            cluster_users_group_dns = optional(set(string))
        })))
    storage_account            = optional(list(object({
            is_default           = bool
            storage_account_key  = string
            storage_container_id = string
            storage_resource_id  = optional(string)
        })))
    storage_account_gen2       = optional(list(object({
            filesystem_id                = string
            is_default                   = bool
            managed_identity_resource_id = string
            storage_resource_id          = string
        })))
  }))
}
