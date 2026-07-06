resource "azurerm_eventhub_authorization_rule" "eventhub_authorization_rules" {
  for_each = var.eventhub_authorization_rules

  eventhub_name       = each.value.eventhub_name
  name                = each.value.name
  namespace_name      = each.value.namespace_name
  resource_group_name = each.value.resource_group_name
  listen              = each.value.listen
  manage              = each.value.manage
  send                = each.value.send
}
