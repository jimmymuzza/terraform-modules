resource "azurerm_stream_analytics_cluster" "stream_analytics_clusters" {
  for_each = var.stream_analytics_clusters

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  streaming_capacity  = each.value.streaming_capacity
  tags                = each.value.tags
}
