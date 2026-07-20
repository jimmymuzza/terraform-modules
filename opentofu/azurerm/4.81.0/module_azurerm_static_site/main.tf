resource "azurerm_static_site" "static_sites" {
  for_each = var.static_sites

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  app_settings        = each.value.app_settings
  sku_size            = each.value.sku_size
  sku_tier            = each.value.sku_tier
  tags                = each.value.tags

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }
}
