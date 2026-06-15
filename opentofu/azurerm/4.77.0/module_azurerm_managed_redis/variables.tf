variable "managed_redis" {
  description = <<EOT
Map of managed_redis, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sku_name
Optional:
    - high_availability_enabled
    - public_network_access
    - tags
    - customer_managed_key
    - default_database
    - identity
EOT

  type = map(object({
    location                  = string
    name                      = string
    resource_group_name       = string
    sku_name                  = string
    high_availability_enabled = optional(bool)
    public_network_access     = optional(string)
    tags                      = optional(map(string))
    customer_managed_key      = optional(list(object({
            key_vault_key_id          = string
            user_assigned_identity_id = string
        })))
    default_database          = optional(list(object({
            access_keys_authentication_enabled            = optional(bool)
            client_protocol                               = optional(string)
            clustering_policy                             = optional(string)
            eviction_policy                               = optional(string)
            geo_replication_group_name                    = optional(string)
            persistence_append_only_file_backup_frequency = optional(string)
            persistence_redis_database_backup_frequency   = optional(string)
            module                                        = optional(list(object({
                name = string
                args = optional(string)
            })))
        })))
    identity                  = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
  }))
}
