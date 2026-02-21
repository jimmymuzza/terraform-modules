resource "azurerm_storage_sync" "storage_syncs" {
  for_each = var.storage_syncs

  location                = each.value.location
  name                    = each.value.name
  resource_group_name     = each.value.resource_group_name
  incoming_traffic_policy = each.value.incoming_traffic_policy
  tags                    = each.value.tags
}
