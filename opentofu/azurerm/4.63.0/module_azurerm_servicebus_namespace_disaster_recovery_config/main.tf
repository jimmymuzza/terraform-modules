resource "azurerm_servicebus_namespace_disaster_recovery_config" "servicebus_namespace_disaster_recovery_configs" {
  for_each = var.servicebus_namespace_disaster_recovery_configs

  name                        = each.value.name
  partner_namespace_id        = each.value.partner_namespace_id
  primary_namespace_id        = each.value.primary_namespace_id
  alias_authorization_rule_id = each.value.alias_authorization_rule_id
}
