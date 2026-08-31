resource "azurerm_log_analytics_workspace" "log_analytics_workspaces" {
  for_each = var.log_analytics_workspaces

  location                                = each.value.location
  name                                    = each.value.name
  resource_group_name                     = each.value.resource_group_name
  allow_resource_only_permissions         = each.value.allow_resource_only_permissions
  cmk_for_query_forced                    = each.value.cmk_for_query_forced
  daily_quota_gb                          = each.value.daily_quota_gb
  data_collection_rule_id                 = each.value.data_collection_rule_id
  immediate_data_purge_on_30_days_enabled = each.value.immediate_data_purge_on_30_days_enabled
  internet_ingestion_access_type          = each.value.internet_ingestion_access_type
  internet_query_access_type              = each.value.internet_query_access_type
  local_authentication_enabled            = each.value.local_authentication_enabled
  reservation_capacity_in_gb_per_day      = each.value.reservation_capacity_in_gb_per_day
  retention_in_days                       = each.value.retention_in_days
  sku                                     = each.value.sku
  tags                                    = each.value.tags

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }
}
