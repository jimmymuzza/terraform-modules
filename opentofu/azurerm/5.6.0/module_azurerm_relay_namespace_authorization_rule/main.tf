resource "azurerm_relay_namespace_authorization_rule" "relay_namespace_authorization_rules" {
  for_each = var.relay_namespace_authorization_rules

  name                = each.value.name
  namespace_name      = each.value.namespace_name
  resource_group_name = each.value.resource_group_name
  listen              = each.value.listen
  manage              = each.value.manage
  send                = each.value.send
}
