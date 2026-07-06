resource "azurerm_eventhub_namespace_disaster_recovery_config" "eventhub_namespace_disaster_recovery_configs" {
  for_each = var.eventhub_namespace_disaster_recovery_configs

  name                 = each.value.name
  namespace_name       = each.value.namespace_name
  partner_namespace_id = each.value.partner_namespace_id
  resource_group_name  = each.value.resource_group_name
}
