resource "azurerm_dedicated_hardware_security_module" "dedicated_hardware_security_modules" {
  for_each = var.dedicated_hardware_security_modules

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  sku_name            = each.value.sku_name
  stamp_id            = each.value.stamp_id
  tags                = each.value.tags
  zones               = each.value.zones

  dynamic "management_network_profile" {
    for_each = each.value.management_network_profile != null ? each.value.management_network_profile : []
    content {
      network_interface_private_ip_addresses = management_network_profile.value.network_interface_private_ip_addresses
      subnet_id                              = management_network_profile.value.subnet_id
    }
  }

  dynamic "network_profile" {
    for_each = each.value.network_profile != null ? each.value.network_profile : []
    content {
      network_interface_private_ip_addresses = network_profile.value.network_interface_private_ip_addresses
      subnet_id                              = network_profile.value.subnet_id
    }
  }
}
