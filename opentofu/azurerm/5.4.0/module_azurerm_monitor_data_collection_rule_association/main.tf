resource "azurerm_monitor_data_collection_rule_association" "monitor_data_collection_rule_associations" {
  for_each = var.monitor_data_collection_rule_associations

  target_resource_id          = each.value.target_resource_id
  data_collection_endpoint_id = each.value.data_collection_endpoint_id
  data_collection_rule_id     = each.value.data_collection_rule_id
  description                 = each.value.description
  name                        = each.value.name
}
