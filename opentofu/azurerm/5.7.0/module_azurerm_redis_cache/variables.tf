variable "redis_caches" {
  description = <<EOT
Map of redis_caches, attributes below
Required:
    - capacity
    - family
    - location
    - name
    - resource_group_name
    - sku_name
Optional:
    - access_keys_authentication_enabled
    - minimum_tls_version
    - non_ssl_port_enabled
    - private_static_ip_address
    - public_network_access_enabled
    - redis_version
    - replicas_per_master
    - replicas_per_primary
    - shard_count
    - subnet_id
    - tags
    - tenant_settings
    - zones
    - identity
    - patch_schedule
    - redis_configuration
EOT

  type = map(object({
    capacity                           = number
    family                             = string
    location                           = string
    name                               = string
    resource_group_name                = string
    sku_name                           = string
    access_keys_authentication_enabled = optional(bool)
    minimum_tls_version                = optional(string)
    non_ssl_port_enabled               = optional(bool)
    private_static_ip_address          = optional(string)
    public_network_access_enabled      = optional(bool)
    redis_version                      = optional(string)
    replicas_per_master                = optional(number)
    replicas_per_primary               = optional(number)
    shard_count                        = optional(number)
    subnet_id                          = optional(string)
    tags                               = optional(map(string))
    tenant_settings                    = optional(map(string))
    zones                              = optional(set(string))
    identity                           = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    patch_schedule                     = optional(list(object({
            day_of_week        = string
            maintenance_window = optional(string)
            start_hour_utc     = optional(number)
        })))
    redis_configuration                = optional(list(object({
            active_directory_authentication_enabled = optional(bool)
            aof_backup_enabled                      = optional(bool)
            aof_storage_connection_string_0         = optional(string)
            aof_storage_connection_string_1         = optional(string)
            authentication_enabled                  = optional(bool)
            data_persistence_authentication_method  = optional(string)
            maxfragmentationmemory_reserved         = optional(number)
            maxmemory_delta                         = optional(number)
            maxmemory_policy                        = optional(string)
            maxmemory_reserved                      = optional(number)
            notify_keyspace_events                  = optional(string)
            rdb_backup_enabled                      = optional(bool)
            rdb_backup_frequency                    = optional(number)
            rdb_backup_max_snapshot_count           = optional(number)
            rdb_storage_connection_string           = optional(string)
            storage_account_subscription_id         = optional(string)
        })))
  }))
}
