resource "azurerm_cdn_profile" "cdn_profiles" {
  for_each = var.cdn_profiles

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  sku                 = each.value.sku
  tags                = each.value.tags
}
