resource "azurerm_eventhub_consumer_group" "eventhub_consumer_groups" {
  for_each = var.eventhub_consumer_groups

  eventhub_name       = each.value.eventhub_name
  name                = each.value.name
  namespace_name      = each.value.namespace_name
  resource_group_name = each.value.resource_group_name
  user_metadata       = each.value.user_metadata
}
