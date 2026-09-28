resource "azurerm_kusto_iothub_data_connection" "kusto_iothub_data_connections" {
  for_each = var.kusto_iothub_data_connections

  cluster_name              = each.value.cluster_name
  consumer_group            = each.value.consumer_group
  database_name             = each.value.database_name
  iothub_id                 = each.value.iothub_id
  location                  = each.value.location
  name                      = each.value.name
  resource_group_name       = each.value.resource_group_name
  shared_access_policy_name = each.value.shared_access_policy_name
  data_format               = each.value.data_format
  database_routing_type     = each.value.database_routing_type
  event_system_properties   = each.value.event_system_properties
  mapping_rule_name         = each.value.mapping_rule_name
  retrieval_start_date      = each.value.retrieval_start_date
  table_name                = each.value.table_name
}
