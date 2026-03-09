resource "azurerm_app_service_virtual_network_swift_connection" "app_service_virtual_network_swift_connections" {
  for_each = var.app_service_virtual_network_swift_connections

  app_service_id = each.value.app_service_id
  subnet_id      = each.value.subnet_id
}
