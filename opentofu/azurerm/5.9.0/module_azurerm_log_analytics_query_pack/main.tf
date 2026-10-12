resource "azurerm_log_analytics_query_pack" "log_analytics_query_packs" {
  for_each = var.log_analytics_query_packs

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags
}
