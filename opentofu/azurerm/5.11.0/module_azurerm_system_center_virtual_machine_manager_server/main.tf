resource "azurerm_system_center_virtual_machine_manager_server" "system_center_virtual_machine_manager_servers" {
  for_each = var.system_center_virtual_machine_manager_servers

  custom_location_id  = each.value.custom_location_id
  fqdn                = each.value.fqdn
  location            = each.value.location
  name                = each.value.name
  password            = each.value.password
  resource_group_name = each.value.resource_group_name
  username            = each.value.username
  port                = each.value.port
  tags                = each.value.tags
}
