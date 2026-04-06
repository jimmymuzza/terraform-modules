variable "mysql_flexible_servers" {
  description = <<EOT
Map of mysql_flexible_servers, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - administrator_login
    - administrator_password
    - administrator_password_wo
    - administrator_password_wo_version
    - backup_retention_days
    - create_mode
    - delegated_subnet_id
    - geo_redundant_backup_enabled
    - point_in_time_restore_time_in_utc
    - private_dns_zone_id
    - public_network_access
    - replication_role
    - sku_name
    - source_server_id
    - tags
    - version
    - zone
    - customer_managed_key
    - high_availability
    - identity
    - maintenance_window
    - storage
EOT

  type = map(object({
    location                          = string
    name                              = string
    resource_group_name               = string
    administrator_login               = optional(string)
    administrator_password            = optional(string)
    administrator_password_wo         = optional(string)
    administrator_password_wo_version = optional(number)
    backup_retention_days             = optional(number)
    create_mode                       = optional(string)
    delegated_subnet_id               = optional(string)
    geo_redundant_backup_enabled      = optional(bool)
    point_in_time_restore_time_in_utc = optional(string)
    private_dns_zone_id               = optional(string)
    public_network_access             = optional(string)
    replication_role                  = optional(string)
    sku_name                          = optional(string)
    source_server_id                  = optional(string)
    tags                              = optional(map(string))
    version                           = optional(string)
    zone                              = optional(string)
    customer_managed_key              = optional(list(object({
            geo_backup_key_vault_key_id          = optional(string)
            geo_backup_user_assigned_identity_id = optional(string)
            key_vault_key_id                     = optional(string)
            managed_hsm_key_id                   = optional(string)
            primary_user_assigned_identity_id    = optional(string)
        })))
    high_availability                 = optional(list(object({
            mode                      = string
            standby_availability_zone = optional(string)
        })))
    identity                          = optional(list(object({
            identity_ids = set(string)
            type         = string
        })))
    maintenance_window                = optional(list(object({
            day_of_week  = optional(number)
            start_hour   = optional(number)
            start_minute = optional(number)
        })))
    storage                           = optional(list(object({
            auto_grow_enabled   = optional(bool)
            io_scaling_enabled  = optional(bool)
            iops                = optional(number)
            log_on_disk_enabled = optional(bool)
            size_gb             = optional(number)
        })))
  }))
}
