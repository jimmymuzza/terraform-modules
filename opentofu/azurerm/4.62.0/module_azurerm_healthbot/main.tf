resource "azurerm_healthbot" "healthbots" {
  for_each = var.healthbots

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  sku_name            = each.value.sku_name
  tags                = each.value.tags
}
