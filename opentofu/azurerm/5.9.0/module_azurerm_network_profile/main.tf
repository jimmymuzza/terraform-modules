resource "azurerm_network_profile" "network_profiles" {
  for_each = var.network_profiles

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags

  dynamic "container_network_interface" {
    for_each = each.value.container_network_interface != null ? each.value.container_network_interface : []
    content {
      name = container_network_interface.value.name

      dynamic "ip_configuration" {
        for_each = container_network_interface.value.ip_configuration != null ? container_network_interface.value.ip_configuration : []
        content {
          name      = ip_configuration.value.name
          subnet_id = ip_configuration.value.subnet_id
        }
      }
    }
  }
}
