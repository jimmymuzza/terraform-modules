resource "azurerm_servicebus_namespace_authorization_rule" "servicebus_namespace_authorization_rules" {
  for_each = var.servicebus_namespace_authorization_rules

  name         = each.value.name
  namespace_id = each.value.namespace_id
  listen       = each.value.listen
  manage       = each.value.manage
  send         = each.value.send
}
