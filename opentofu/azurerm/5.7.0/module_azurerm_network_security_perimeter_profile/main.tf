resource "azurerm_network_security_perimeter_profile" "network_security_perimeter_profiles" {
  for_each = var.network_security_perimeter_profiles

  name                          = each.value.name
  network_security_perimeter_id = each.value.network_security_perimeter_id
}
