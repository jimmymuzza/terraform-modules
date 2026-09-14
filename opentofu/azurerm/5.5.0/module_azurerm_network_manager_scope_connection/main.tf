resource "azurerm_network_manager_scope_connection" "network_manager_scope_connections" {
  for_each = var.network_manager_scope_connections

  name               = each.value.name
  network_manager_id = each.value.network_manager_id
  target_scope_id    = each.value.target_scope_id
  tenant_id          = each.value.tenant_id
  description        = each.value.description
}
