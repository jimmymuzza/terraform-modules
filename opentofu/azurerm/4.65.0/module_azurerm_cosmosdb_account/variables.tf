variable "cosmosdb_accounts" {
  description = <<EOT
Map of cosmosdb_accounts, attributes below
Required:
    - location
    - name
    - offer_type
    - resource_group_name
    - consistency_policy
    - geo_location
Optional:
    - access_key_metadata_writes_enabled
    - analytical_storage_enabled
    - automatic_failover_enabled
    - burst_capacity_enabled
    - create_mode
    - default_identity_type
    - free_tier_enabled
    - ip_range_filter
    - is_virtual_network_filter_enabled
    - key_vault_key_id
    - kind
    - local_authentication_disabled
    - managed_hsm_key_id
    - minimal_tls_version
    - mongo_server_version
    - multiple_write_locations_enabled
    - network_acl_bypass_for_azure_services
    - network_acl_bypass_ids
    - partition_merge_enabled
    - public_network_access_enabled
    - tags
    - analytical_storage
    - backup
    - capabilities
    - capacity
    - cors_rule
    - identity
    - restore
    - virtual_network_rule
EOT

  type = map(object({
    location                              = string
    name                                  = string
    offer_type                            = string
    resource_group_name                   = string
    access_key_metadata_writes_enabled    = optional(bool)
    analytical_storage_enabled            = optional(bool)
    automatic_failover_enabled            = optional(bool)
    burst_capacity_enabled                = optional(bool)
    create_mode                           = optional(string)
    default_identity_type                 = optional(string)
    free_tier_enabled                     = optional(bool)
    ip_range_filter                       = optional(set(string))
    is_virtual_network_filter_enabled     = optional(bool)
    key_vault_key_id                      = optional(string)
    kind                                  = optional(string)
    local_authentication_disabled         = optional(bool)
    managed_hsm_key_id                    = optional(string)
    minimal_tls_version                   = optional(string)
    mongo_server_version                  = optional(string)
    multiple_write_locations_enabled      = optional(bool)
    network_acl_bypass_for_azure_services = optional(bool)
    network_acl_bypass_ids                = optional(list(string))
    partition_merge_enabled               = optional(bool)
    public_network_access_enabled         = optional(bool)
    tags                                  = optional(map(string))
    analytical_storage                    = optional(list(object({
            schema_type = string
        })))
    backup                                = optional(list(object({
            type                = string
            interval_in_minutes = optional(number)
            retention_in_hours  = optional(number)
            storage_redundancy  = optional(string)
            tier                = optional(string)
        })))
    capabilities                          = optional(set(object({
            name = string
        })))
    capacity                              = optional(list(object({
            total_throughput_limit = number
        })))
    consistency_policy                    = list(object({
            consistency_level       = string
            max_interval_in_seconds = optional(number)
            max_staleness_prefix    = optional(number)
        }))
    cors_rule                             = optional(list(object({
            allowed_headers    = list(string)
            allowed_methods    = list(string)
            allowed_origins    = list(string)
            exposed_headers    = list(string)
            max_age_in_seconds = optional(number)
        })))
    geo_location                          = set(object({
            failover_priority = number
            location          = string
            zone_redundant    = optional(bool)
        }))
    identity                              = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    restore                               = optional(list(object({
            restore_timestamp_in_utc   = string
            source_cosmosdb_account_id = string
            tables_to_restore          = optional(list(string))
            database                   = optional(set(object({
                name             = string
                collection_names = optional(set(string))
            })))
            gremlin_database           = optional(list(object({
                name        = string
                graph_names = optional(list(string))
            })))
        })))
    virtual_network_rule                  = optional(set(object({
            ignore_missing_vnet_service_endpoint = optional(bool)
        })))
  }))
}
