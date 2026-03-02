resource "azurerm_servicebus_queue_authorization_rule" "servicebus_queue_authorization_rules" {
  for_each = var.servicebus_queue_authorization_rules

  name     = each.value.name
  queue_id = each.value.queue_id
  listen   = each.value.listen
  manage   = each.value.manage
  send     = each.value.send
}
