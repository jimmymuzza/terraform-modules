variable "postgresql_servers" {
  description = <<EOT
Map of postgresql_servers, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sku_name
    - ssl_enforcement_enabled
    - version
Optional:
    - administrator_login
    - administrator_login_password
    - administrator_login_password_wo
    - administrator_login_password_wo_version
    - auto_grow_enabled
    - backup_retention_days
    - create_mode
    - creation_source_server_id
    - geo_redundant_backup_enabled
    - infrastructure_encryption_enabled
    - public_network_access_enabled
    - restore_point_in_time
    - ssl_minimal_tls_version_enforced
    - storage_mb
    - tags
    - identity
    - threat_detection_policy
EOT

  type = map(object({
    location                                = string
    name                                    = string
    resource_group_name                     = string
    sku_name                                = string
    ssl_enforcement_enabled                 = bool
    version                                 = string
    administrator_login                     = optional(string)
    administrator_login_password            = optional(string)
    administrator_login_password_wo         = optional(string)
    administrator_login_password_wo_version = optional(number)
    auto_grow_enabled                       = optional(bool)
    backup_retention_days                   = optional(number)
    create_mode                             = optional(string)
    creation_source_server_id               = optional(string)
    geo_redundant_backup_enabled            = optional(bool)
    infrastructure_encryption_enabled       = optional(bool)
    public_network_access_enabled           = optional(bool)
    restore_point_in_time                   = optional(string)
    ssl_minimal_tls_version_enforced        = optional(string)
    storage_mb                              = optional(number)
    tags                                    = optional(map(string))
    identity                                = optional(list(object({
            type = string
        })))
    threat_detection_policy                 = optional(list(object({
            disabled_alerts            = optional(set(string))
            email_account_admins       = optional(bool)
            email_addresses            = optional(set(string))
            enabled                    = optional(bool)
            retention_days             = optional(number)
            storage_account_access_key = optional(string)
            storage_endpoint           = optional(string)
        })))
  }))
}
