resource "azurerm_iothub_endpoint_servicebus_topic" "iothub_endpoint_servicebus_topics" {
  for_each = var.iothub_endpoint_servicebus_topics

  iothub_id           = each.value.iothub_id
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  authentication_type = each.value.authentication_type
  connection_string   = each.value.connection_string
  endpoint_uri        = each.value.endpoint_uri
  entity_path         = each.value.entity_path
  identity_id         = each.value.identity_id
  subscription_id     = each.value.subscription_id
}
