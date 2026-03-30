resource "azurerm_servicebus_topic_authorization_rule" "servicebus_topic_authorization_rules" {
  for_each = var.servicebus_topic_authorization_rules

  name     = each.value.name
  topic_id = each.value.topic_id
  listen   = each.value.listen
  manage   = each.value.manage
  send     = each.value.send
}
