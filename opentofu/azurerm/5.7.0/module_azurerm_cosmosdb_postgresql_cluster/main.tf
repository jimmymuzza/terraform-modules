resource "azurerm_cosmosdb_postgresql_cluster" "cosmosdb_postgresql_clusters" {
  for_each = var.cosmosdb_postgresql_clusters

  location                             = each.value.location
  name                                 = each.value.name
  node_count                           = each.value.node_count
  resource_group_name                  = each.value.resource_group_name
  administrator_login_password         = each.value.administrator_login_password
  citus_version                        = each.value.citus_version
  coordinator_public_ip_access_enabled = each.value.coordinator_public_ip_access_enabled
  coordinator_server_edition           = each.value.coordinator_server_edition
  coordinator_storage_quota_in_mb      = each.value.coordinator_storage_quota_in_mb
  coordinator_vcore_count              = each.value.coordinator_vcore_count
  ha_enabled                           = each.value.ha_enabled
  node_public_ip_access_enabled        = each.value.node_public_ip_access_enabled
  node_server_edition                  = each.value.node_server_edition
  node_storage_quota_in_mb             = each.value.node_storage_quota_in_mb
  node_vcores                          = each.value.node_vcores
  point_in_time_in_utc                 = each.value.point_in_time_in_utc
  preferred_primary_zone               = each.value.preferred_primary_zone
  shards_on_coordinator_enabled        = each.value.shards_on_coordinator_enabled
  source_location                      = each.value.source_location
  source_resource_id                   = each.value.source_resource_id
  sql_version                          = each.value.sql_version
  tags                                 = each.value.tags

  dynamic "maintenance_window" {
    for_each = each.value.maintenance_window != null ? each.value.maintenance_window : []
    content {
      day_of_week  = maintenance_window.value.day_of_week
      start_hour   = maintenance_window.value.start_hour
      start_minute = maintenance_window.value.start_minute
    }
  }
}
