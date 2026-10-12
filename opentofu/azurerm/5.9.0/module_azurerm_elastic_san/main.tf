resource "azurerm_elastic_san" "elastic_sans" {
  for_each = var.elastic_sans

  base_size_in_tib     = each.value.base_size_in_tib
  location             = each.value.location
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  extended_size_in_tib = each.value.extended_size_in_tib
  tags                 = each.value.tags
  zones                = each.value.zones

  dynamic "sku" {
    for_each = each.value.sku != null ? each.value.sku : []
    content {
      name = sku.value.name
      tier = sku.value.tier
    }
  }
}
