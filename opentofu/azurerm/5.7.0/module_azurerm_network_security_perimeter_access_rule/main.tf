resource "azurerm_network_security_perimeter_access_rule" "network_security_perimeter_access_rules" {
  for_each = var.network_security_perimeter_access_rules

  direction                             = each.value.direction
  name                                  = each.value.name
  network_security_perimeter_profile_id = each.value.network_security_perimeter_profile_id
  address_prefixes                      = each.value.address_prefixes
  fqdns                                 = each.value.fqdns
  service_tags                          = each.value.service_tags
  subscription_ids                      = each.value.subscription_ids
}
