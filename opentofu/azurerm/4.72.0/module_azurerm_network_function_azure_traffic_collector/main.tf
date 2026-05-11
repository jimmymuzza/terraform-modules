resource "azurerm_network_function_azure_traffic_collector" "network_function_azure_traffic_collectors" {
  for_each = var.network_function_azure_traffic_collectors

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags
}
