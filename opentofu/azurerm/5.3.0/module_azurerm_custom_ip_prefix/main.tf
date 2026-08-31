resource "azurerm_custom_ip_prefix" "custom_ip_prefixes" {
  for_each = var.custom_ip_prefixes

  cidr                          = each.value.cidr
  location                      = each.value.location
  name                          = each.value.name
  resource_group_name           = each.value.resource_group_name
  commissioning_enabled         = each.value.commissioning_enabled
  internet_advertising_disabled = each.value.internet_advertising_disabled
  parent_custom_ip_prefix_id    = each.value.parent_custom_ip_prefix_id
  roa_validity_end_date         = each.value.roa_validity_end_date
  tags                          = each.value.tags
  wan_validation_signed_message = each.value.wan_validation_signed_message
  zones                         = each.value.zones
}
