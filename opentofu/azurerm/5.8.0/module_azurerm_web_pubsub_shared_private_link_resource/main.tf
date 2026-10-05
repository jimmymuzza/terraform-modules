resource "azurerm_web_pubsub_shared_private_link_resource" "web_pubsub_shared_private_link_resources" {
  for_each = var.web_pubsub_shared_private_link_resources

  name               = each.value.name
  subresource_name   = each.value.subresource_name
  target_resource_id = each.value.target_resource_id
  web_pubsub_id      = each.value.web_pubsub_id
  request_message    = each.value.request_message
}
