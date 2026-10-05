resource "azurerm_log_analytics_cluster" "log_analytics_clusters" {
  for_each = var.log_analytics_clusters

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  size_gb             = each.value.size_gb
  tags                = each.value.tags

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }
}
