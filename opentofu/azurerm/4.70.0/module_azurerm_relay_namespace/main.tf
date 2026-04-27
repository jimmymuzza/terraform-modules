resource "azurerm_relay_namespace" "relay_namespaces" {
  for_each = var.relay_namespaces

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  sku_name            = each.value.sku_name
  tags                = each.value.tags
}
