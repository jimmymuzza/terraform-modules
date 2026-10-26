resource "azurerm_notification_hub_authorization_rule" "notification_hub_authorization_rules" {
  for_each = var.notification_hub_authorization_rules

  name                  = each.value.name
  namespace_name        = each.value.namespace_name
  notification_hub_name = each.value.notification_hub_name
  resource_group_name   = each.value.resource_group_name
  listen                = each.value.listen
  manage                = each.value.manage
  send                  = each.value.send
}
