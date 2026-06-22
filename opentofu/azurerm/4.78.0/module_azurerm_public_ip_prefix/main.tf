resource "azurerm_public_ip_prefix" "public_ip_prefixes" {
  for_each = var.public_ip_prefixes

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  custom_ip_prefix_id = each.value.custom_ip_prefix_id
  ip_version          = each.value.ip_version
  prefix_length       = each.value.prefix_length
  sku                 = each.value.sku
  sku_tier            = each.value.sku_tier
  tags                = each.value.tags
  zones               = each.value.zones
}
