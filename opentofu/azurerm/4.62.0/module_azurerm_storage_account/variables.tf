variable "storage_accounts" {
  description = <<EOT
Map of storage_accounts, attributes below
Required:
    - account_replication_type
    - account_tier
    - location
    - name
    - resource_group_name
Optional:
    - access_tier
    - account_kind
    - allow_nested_items_to_be_public
    - allowed_copy_scope
    - cross_tenant_replication_enabled
    - default_to_oauth_authentication
    - dns_endpoint_type
    - edge_zone
    - https_traffic_only_enabled
    - infrastructure_encryption_enabled
    - is_hns_enabled
    - large_file_share_enabled
    - local_user_enabled
    - min_tls_version
    - nfsv3_enabled
    - provisioned_billing_model_version
    - public_network_access_enabled
    - queue_encryption_key_type
    - sftp_enabled
    - shared_access_key_enabled
    - table_encryption_key_type
    - tags
    - azure_files_authentication
    - blob_properties
    - custom_domain
    - customer_managed_key
    - identity
    - immutability_policy
    - network_rules
    - queue_properties
    - routing
    - sas_policy
    - share_properties
    - static_website
EOT

  type = map(object({
    account_replication_type          = string
    account_tier                      = string
    location                          = string
    name                              = string
    resource_group_name               = string
    access_tier                       = optional(string)
    account_kind                      = optional(string)
    allow_nested_items_to_be_public   = optional(bool)
    allowed_copy_scope                = optional(string)
    cross_tenant_replication_enabled  = optional(bool)
    default_to_oauth_authentication   = optional(bool)
    dns_endpoint_type                 = optional(string)
    edge_zone                         = optional(string)
    https_traffic_only_enabled        = optional(bool)
    infrastructure_encryption_enabled = optional(bool)
    is_hns_enabled                    = optional(bool)
    large_file_share_enabled          = optional(bool)
    local_user_enabled                = optional(bool)
    min_tls_version                   = optional(string)
    nfsv3_enabled                     = optional(bool)
    provisioned_billing_model_version = optional(string)
    public_network_access_enabled     = optional(bool)
    queue_encryption_key_type         = optional(string)
    sftp_enabled                      = optional(bool)
    shared_access_key_enabled         = optional(bool)
    table_encryption_key_type         = optional(string)
    tags                              = optional(map(string))
    azure_files_authentication        = optional(list(object({
            directory_type                 = string
            default_share_level_permission = optional(string)
            active_directory               = optional(list(object({
                domain_guid         = string
                domain_name         = string
                domain_sid          = optional(string)
                forest_name         = optional(string)
                netbios_domain_name = optional(string)
                storage_sid         = optional(string)
            })))
        })))
    blob_properties                   = optional(list(object({
            change_feed_enabled               = optional(bool)
            change_feed_retention_in_days     = optional(number)
            default_service_version           = optional(string)
            last_access_time_enabled          = optional(bool)
            versioning_enabled                = optional(bool)
            container_delete_retention_policy = optional(list(object({
                days = optional(number)
            })))
            cors_rule                         = optional(list(object({
                allowed_headers    = list(string)
                allowed_methods    = list(string)
                allowed_origins    = list(string)
                exposed_headers    = list(string)
                max_age_in_seconds = number
            })))
            delete_retention_policy           = optional(list(object({
                days                     = optional(number)
                permanent_delete_enabled = optional(bool)
            })))
            restore_policy                    = optional(list(object({
                days = number
            })))
        })))
    custom_domain                     = optional(list(object({
            name          = string
            use_subdomain = optional(bool)
        })))
    customer_managed_key              = optional(list(object({
            user_assigned_identity_id = string
            key_vault_key_id          = optional(string)
            managed_hsm_key_id        = optional(string)
        })))
    identity                          = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    immutability_policy               = optional(list(object({
            allow_protected_append_writes = bool
            period_since_creation_in_days = number
            state                         = string
        })))
    network_rules                     = optional(list(object({
            default_action             = string
            bypass                     = optional(set(string))
            ip_rules                   = optional(set(string))
            virtual_network_subnet_ids = optional(set(string))
            private_link_access        = optional(list(object({
                endpoint_resource_id = string
                endpoint_tenant_id   = optional(string)
            })))
        })))
    queue_properties                  = optional(list(object({
            cors_rule      = optional(list(object({
                allowed_headers    = list(string)
                allowed_methods    = list(string)
                allowed_origins    = list(string)
                exposed_headers    = list(string)
                max_age_in_seconds = number
            })))
            hour_metrics   = optional(list(object({
                enabled               = bool
                version               = string
                include_apis          = optional(bool)
                retention_policy_days = optional(number)
            })))
            logging        = optional(list(object({
                delete                = bool
                read                  = bool
                version               = string
                write                 = bool
                retention_policy_days = optional(number)
            })))
            minute_metrics = optional(list(object({
                enabled               = bool
                version               = string
                include_apis          = optional(bool)
                retention_policy_days = optional(number)
            })))
        })))
    routing                           = optional(list(object({
            choice                      = optional(string)
            publish_internet_endpoints  = optional(bool)
            publish_microsoft_endpoints = optional(bool)
        })))
    sas_policy                        = optional(list(object({
            expiration_period = string
            expiration_action = optional(string)
        })))
    share_properties                  = optional(list(object({
            cors_rule        = optional(list(object({
                allowed_headers    = list(string)
                allowed_methods    = list(string)
                allowed_origins    = list(string)
                exposed_headers    = list(string)
                max_age_in_seconds = number
            })))
            retention_policy = optional(list(object({
                days = optional(number)
            })))
            smb              = optional(list(object({
                authentication_types            = optional(set(string))
                channel_encryption_type         = optional(set(string))
                kerberos_ticket_encryption_type = optional(set(string))
                multichannel_enabled            = optional(bool)
                versions                        = optional(set(string))
            })))
        })))
    static_website                    = optional(list(object({
            error_404_document = optional(string)
            index_document     = optional(string)
        })))
  }))
}
