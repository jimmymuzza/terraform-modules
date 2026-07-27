resource "azurerm_network_manager_subscription_connection" "network_manager_subscription_connections" {
  for_each = var.network_manager_subscription_connections

  name               = each.value.name
  network_manager_id = each.value.network_manager_id
  subscription_id    = each.value.subscription_id
  description        = each.value.description
}
