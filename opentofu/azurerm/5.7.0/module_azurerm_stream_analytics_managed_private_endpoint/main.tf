resource "azurerm_stream_analytics_managed_private_endpoint" "stream_analytics_managed_private_endpoints" {
  for_each = var.stream_analytics_managed_private_endpoints

  name                          = each.value.name
  resource_group_name           = each.value.resource_group_name
  stream_analytics_cluster_name = each.value.stream_analytics_cluster_name
  subresource_name              = each.value.subresource_name
  target_resource_id            = each.value.target_resource_id
}
