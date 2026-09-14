resource "azurerm_powerbi_embedded" "powerbi_embeddeds" {
  for_each = var.powerbi_embeddeds

  administrators      = each.value.administrators
  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  sku_name            = each.value.sku_name
  mode                = each.value.mode
  tags                = each.value.tags
}
