resource "azurerm_app_service_slot_virtual_network_swift_connection" "app_service_slot_virtual_network_swift_connections" {
  for_each = var.app_service_slot_virtual_network_swift_connections

  app_service_id = each.value.app_service_id
  slot_name      = each.value.slot_name
  subnet_id      = each.value.subnet_id
}
