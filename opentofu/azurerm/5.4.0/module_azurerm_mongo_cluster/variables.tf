variable "mongo_clusters" {
  description = <<EOT
Map of mongo_clusters, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - administrator_password
    - administrator_username
    - authentication_methods
    - compute_tier
    - create_mode
    - data_api_mode_enabled
    - high_availability_mode
    - preview_features
    - public_network_access
    - shard_count
    - source_location
    - source_server_id
    - storage_size_in_gb
    - storage_type
    - tags
    - version
    - customer_managed_key
    - identity
    - restore
EOT

  type = map(object({
    location               = string
    name                   = string
    resource_group_name    = string
    administrator_password = optional(string)
    administrator_username = optional(string)
    authentication_methods = optional(set(string))
    compute_tier           = optional(string)
    create_mode            = optional(string)
    data_api_mode_enabled  = optional(bool)
    high_availability_mode = optional(string)
    preview_features       = optional(list(string))
    public_network_access  = optional(string)
    shard_count            = optional(number)
    source_location        = optional(string)
    source_server_id       = optional(string)
    storage_size_in_gb     = optional(number)
    storage_type           = optional(string)
    tags                   = optional(map(string))
    version                = optional(string)
    customer_managed_key   = optional(list(object({
            key_vault_key_id          = string
            user_assigned_identity_id = string
        })))
    identity               = optional(list(object({
            identity_ids = set(string)
            type         = string
        })))
    restore                = optional(list(object({
            point_in_time_utc = string
            source_id         = string
        })))
  }))
}
