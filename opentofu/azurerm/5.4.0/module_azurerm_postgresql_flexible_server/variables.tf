variable "postgresql_flexible_servers" {
  description = <<EOT
Map of postgresql_flexible_servers, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - administrator_login
    - administrator_password
    - administrator_password_wo
    - administrator_password_wo_version
    - auto_grow_enabled
    - backup_retention_days
    - create_mode
    - delegated_subnet_id
    - geo_redundant_backup_enabled
    - point_in_time_restore_time_in_utc
    - private_dns_zone_id
    - public_network_access_enabled
    - replication_role
    - sku_name
    - source_server_id
    - storage_iops
    - storage_mb
    - storage_throughput
    - storage_tier
    - storage_type
    - tags
    - version
    - zone
    - authentication
    - cluster
    - customer_managed_key
    - high_availability
    - identity
    - maintenance_window
EOT

  type = map(object({
    location                          = string
    name                              = string
    resource_group_name               = string
    administrator_login               = optional(string)
    administrator_password            = optional(string)
    administrator_password_wo         = optional(string)
    administrator_password_wo_version = optional(number)
    auto_grow_enabled                 = optional(bool)
    backup_retention_days             = optional(number)
    create_mode                       = optional(string)
    delegated_subnet_id               = optional(string)
    geo_redundant_backup_enabled      = optional(bool)
    point_in_time_restore_time_in_utc = optional(string)
    private_dns_zone_id               = optional(string)
    public_network_access_enabled     = optional(bool)
    replication_role                  = optional(string)
    sku_name                          = optional(string)
    source_server_id                  = optional(string)
    storage_iops                      = optional(number)
    storage_mb                        = optional(number)
    storage_throughput                = optional(number)
    storage_tier                      = optional(string)
    storage_type                      = optional(string)
    tags                              = optional(map(string))
    version                           = optional(string)
    zone                              = optional(string)
    authentication                    = optional(list(object({
            active_directory_auth_enabled = optional(bool)
            password_auth_enabled         = optional(bool)
            tenant_id                     = optional(string)
        })))
    cluster                           = optional(list(object({
            size                  = number
            default_database_name = optional(string)
        })))
    customer_managed_key              = optional(list(object({
            key_vault_key_id                     = string
            geo_backup_key_vault_key_id          = optional(string)
            geo_backup_user_assigned_identity_id = optional(string)
            primary_user_assigned_identity_id    = optional(string)
        })))
    high_availability                 = optional(list(object({
            mode                      = string
            standby_availability_zone = optional(string)
        })))
    identity                          = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    maintenance_window                = optional(list(object({
            day_of_week  = optional(number)
            start_hour   = optional(number)
            start_minute = optional(number)
        })))
  }))
}
