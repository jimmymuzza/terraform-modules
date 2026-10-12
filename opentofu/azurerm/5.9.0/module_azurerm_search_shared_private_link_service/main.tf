resource "azurerm_search_shared_private_link_service" "search_shared_private_link_services" {
  for_each = var.search_shared_private_link_services

  name               = each.value.name
  search_service_id  = each.value.search_service_id
  subresource_name   = each.value.subresource_name
  target_resource_id = each.value.target_resource_id
  request_message    = each.value.request_message
}
