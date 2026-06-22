resource "azurerm_network_function_collector_policy" "network_function_collector_policies" {
  for_each = var.network_function_collector_policies

  location             = each.value.location
  name                 = each.value.name
  traffic_collector_id = each.value.traffic_collector_id
  tags                 = each.value.tags

  dynamic "ipfx_emission" {
    for_each = each.value.ipfx_emission != null ? each.value.ipfx_emission : []
    content {
      destination_types = ipfx_emission.value.destination_types
    }
  }

  dynamic "ipfx_ingestion" {
    for_each = each.value.ipfx_ingestion != null ? each.value.ipfx_ingestion : []
    content {
      source_resource_ids = ipfx_ingestion.value.source_resource_ids
    }
  }
}
