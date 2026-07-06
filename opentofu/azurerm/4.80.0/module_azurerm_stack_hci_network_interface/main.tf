resource "azurerm_stack_hci_network_interface" "stack_hci_network_interfaces" {
  for_each = var.stack_hci_network_interfaces

  custom_location_id  = each.value.custom_location_id
  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  dns_servers         = each.value.dns_servers
  mac_address         = each.value.mac_address
  tags                = each.value.tags

  dynamic "ip_configuration" {
    for_each = each.value.ip_configuration != null ? each.value.ip_configuration : []
    content {
      subnet_id          = ip_configuration.value.subnet_id
      private_ip_address = ip_configuration.value.private_ip_address
    }
  }
}
