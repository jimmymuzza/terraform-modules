resource "azurerm_storage_sync_server_endpoint" "storage_sync_server_endpoints" {
  for_each = var.storage_sync_server_endpoints

  name                       = each.value.name
  registered_server_id       = each.value.registered_server_id
  server_local_path          = each.value.server_local_path
  storage_sync_group_id      = each.value.storage_sync_group_id
  cloud_tiering_enabled      = each.value.cloud_tiering_enabled
  initial_download_policy    = each.value.initial_download_policy
  local_cache_mode           = each.value.local_cache_mode
  tier_files_older_than_days = each.value.tier_files_older_than_days
  volume_free_space_percent  = each.value.volume_free_space_percent
}
