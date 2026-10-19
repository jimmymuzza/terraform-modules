resource "azurerm_monitor_data_collection_endpoint" "monitor_data_collection_endpoints" {
  for_each = var.monitor_data_collection_endpoints

  location                      = each.value.location
  name                          = each.value.name
  resource_group_name           = each.value.resource_group_name
  description                   = each.value.description
  kind                          = each.value.kind
  public_network_access_enabled = each.value.public_network_access_enabled
  tags                          = each.value.tags
}
