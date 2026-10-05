variable "cosmosdb_postgresql_clusters" {
  description = <<EOT
Map of cosmosdb_postgresql_clusters, attributes below
Required:
    - location
    - name
    - node_count
    - resource_group_name
Optional:
    - administrator_login_password
    - citus_version
    - coordinator_public_ip_access_enabled
    - coordinator_server_edition
    - coordinator_storage_quota_in_mb
    - coordinator_vcore_count
    - ha_enabled
    - node_public_ip_access_enabled
    - node_server_edition
    - node_storage_quota_in_mb
    - node_vcores
    - point_in_time_in_utc
    - preferred_primary_zone
    - shards_on_coordinator_enabled
    - source_location
    - source_resource_id
    - sql_version
    - tags
    - maintenance_window
EOT

  type = map(object({
    location                             = string
    name                                 = string
    node_count                           = number
    resource_group_name                  = string
    administrator_login_password         = optional(string)
    citus_version                        = optional(string)
    coordinator_public_ip_access_enabled = optional(bool)
    coordinator_server_edition           = optional(string)
    coordinator_storage_quota_in_mb      = optional(number)
    coordinator_vcore_count              = optional(number)
    ha_enabled                           = optional(bool)
    node_public_ip_access_enabled        = optional(bool)
    node_server_edition                  = optional(string)
    node_storage_quota_in_mb             = optional(number)
    node_vcores                          = optional(number)
    point_in_time_in_utc                 = optional(string)
    preferred_primary_zone               = optional(string)
    shards_on_coordinator_enabled        = optional(bool)
    source_location                      = optional(string)
    source_resource_id                   = optional(string)
    sql_version                          = optional(string)
    tags                                 = optional(map(string))
    maintenance_window                   = optional(list(object({
            day_of_week  = optional(number)
            start_hour   = optional(number)
            start_minute = optional(number)
        })))
  }))
}
