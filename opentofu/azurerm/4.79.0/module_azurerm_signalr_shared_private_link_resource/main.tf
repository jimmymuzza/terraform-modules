resource "azurerm_signalr_shared_private_link_resource" "signalr_shared_private_link_resources" {
  for_each = var.signalr_shared_private_link_resources

  name               = each.value.name
  signalr_service_id = each.value.signalr_service_id
  sub_resource_name  = each.value.sub_resource_name
  target_resource_id = each.value.target_resource_id
  request_message    = each.value.request_message
}
