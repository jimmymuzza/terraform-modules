resource "azurerm_iothub_enrichment" "iothub_enrichments" {
  for_each = var.iothub_enrichments

  endpoint_names      = each.value.endpoint_names
  iothub_name         = each.value.iothub_name
  key                 = each.value.key
  resource_group_name = each.value.resource_group_name
  value               = each.value.value
}
