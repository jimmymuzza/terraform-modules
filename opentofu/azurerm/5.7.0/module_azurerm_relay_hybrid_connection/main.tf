resource "azurerm_relay_hybrid_connection" "relay_hybrid_connections" {
  for_each = var.relay_hybrid_connections

  name                          = each.value.name
  relay_namespace_name          = each.value.relay_namespace_name
  resource_group_name           = each.value.resource_group_name
  requires_client_authorization = each.value.requires_client_authorization
  user_metadata                 = each.value.user_metadata
}
