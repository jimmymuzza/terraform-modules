resource "azurerm_monitor_private_link_scope" "monitor_private_link_scopes" {
  for_each = var.monitor_private_link_scopes

  name                  = each.value.name
  resource_group_name   = each.value.resource_group_name
  ingestion_access_mode = each.value.ingestion_access_mode
  query_access_mode     = each.value.query_access_mode
  tags                  = each.value.tags
}
