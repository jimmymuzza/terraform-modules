resource "azurerm_dev_center_attached_network" "dev_center_attached_networks" {
  for_each = var.dev_center_attached_networks

  dev_center_id         = each.value.dev_center_id
  name                  = each.value.name
  network_connection_id = each.value.network_connection_id
}
