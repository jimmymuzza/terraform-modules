resource "azurerm_kusto_eventhub_data_connection" "kusto_eventhub_data_connections" {
  for_each = var.kusto_eventhub_data_connections

  cluster_name            = each.value.cluster_name
  consumer_group          = each.value.consumer_group
  database_name           = each.value.database_name
  eventhub_id             = each.value.eventhub_id
  location                = each.value.location
  name                    = each.value.name
  resource_group_name     = each.value.resource_group_name
  compression             = each.value.compression
  data_format             = each.value.data_format
  database_routing_type   = each.value.database_routing_type
  event_system_properties = each.value.event_system_properties
  identity_id             = each.value.identity_id
  mapping_rule_name       = each.value.mapping_rule_name
  retrieval_start_date    = each.value.retrieval_start_date
  table_name              = each.value.table_name
}
