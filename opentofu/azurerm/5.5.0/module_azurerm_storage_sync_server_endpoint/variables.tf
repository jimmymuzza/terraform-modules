variable "storage_sync_server_endpoints" {
  description = <<EOT
Map of storage_sync_server_endpoints, attributes below
Required:
    - name
    - registered_server_id
    - server_local_path
    - storage_sync_group_id
Optional:
    - cloud_tiering_enabled
    - initial_download_policy
    - local_cache_mode
    - tier_files_older_than_days
    - volume_free_space_percent
EOT

  type = map(object({
    name                       = string
    registered_server_id       = string
    server_local_path          = string
    storage_sync_group_id      = string
    cloud_tiering_enabled      = optional(bool)
    initial_download_policy    = optional(string)
    local_cache_mode           = optional(string)
    tier_files_older_than_days = optional(number)
    volume_free_space_percent  = optional(number)
  }))
}
