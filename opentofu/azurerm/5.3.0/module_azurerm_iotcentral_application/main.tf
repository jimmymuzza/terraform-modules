resource "azurerm_iotcentral_application" "iotcentral_applications" {
  for_each = var.iotcentral_applications

  location                      = each.value.location
  name                          = each.value.name
  resource_group_name           = each.value.resource_group_name
  sub_domain                    = each.value.sub_domain
  display_name                  = each.value.display_name
  public_network_access_enabled = each.value.public_network_access_enabled
  sku                           = each.value.sku
  tags                          = each.value.tags
  template                      = each.value.template

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type = identity.value.type
    }
  }
}
