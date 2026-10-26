resource "azurerm_network_security_perimeter_association" "network_security_perimeter_associations" {
  for_each = var.network_security_perimeter_associations

  access_mode                           = each.value.access_mode
  name                                  = each.value.name
  network_security_perimeter_profile_id = each.value.network_security_perimeter_profile_id
  resource_id                           = each.value.resource_id
}
