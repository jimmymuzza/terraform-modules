resource "azurerm_iothub_consumer_group" "iothub_consumer_groups" {
  for_each = var.iothub_consumer_groups

  eventhub_endpoint_name = each.value.eventhub_endpoint_name
  iothub_name            = each.value.iothub_name
  name                   = each.value.name
  resource_group_name    = each.value.resource_group_name
}
