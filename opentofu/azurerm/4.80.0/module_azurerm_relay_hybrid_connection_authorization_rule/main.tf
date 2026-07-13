resource "azurerm_relay_hybrid_connection_authorization_rule" "relay_hybrid_connection_authorization_rules" {
  for_each = var.relay_hybrid_connection_authorization_rules

  hybrid_connection_name = each.value.hybrid_connection_name
  name                   = each.value.name
  namespace_name         = each.value.namespace_name
  resource_group_name    = each.value.resource_group_name
  listen                 = each.value.listen
  manage                 = each.value.manage
  send                   = each.value.send
}
