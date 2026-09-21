resource "azurerm_eventhub_namespace" "eventhub_namespaces" {
  for_each = var.eventhub_namespaces

  location                      = each.value.location
  name                          = each.value.name
  resource_group_name           = each.value.resource_group_name
  sku                           = each.value.sku
  auto_inflate_enabled          = each.value.auto_inflate_enabled
  capacity                      = each.value.capacity
  dedicated_cluster_id          = each.value.dedicated_cluster_id
  local_authentication_enabled  = each.value.local_authentication_enabled
  maximum_throughput_units      = each.value.maximum_throughput_units
  minimum_tls_version           = each.value.minimum_tls_version
  network_rulesets              = each.value.network_rulesets
  public_network_access_enabled = each.value.public_network_access_enabled
  tags                          = each.value.tags

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }
}
