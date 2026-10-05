resource "azurerm_digital_twins_time_series_database_connection" "digital_twins_time_series_database_connections" {
  for_each = var.digital_twins_time_series_database_connections

  digital_twins_id                = each.value.digital_twins_id
  eventhub_name                   = each.value.eventhub_name
  eventhub_namespace_endpoint_uri = each.value.eventhub_namespace_endpoint_uri
  eventhub_namespace_id           = each.value.eventhub_namespace_id
  kusto_cluster_id                = each.value.kusto_cluster_id
  kusto_cluster_uri               = each.value.kusto_cluster_uri
  kusto_database_name             = each.value.kusto_database_name
  name                            = each.value.name
  eventhub_consumer_group_name    = each.value.eventhub_consumer_group_name
  kusto_table_name                = each.value.kusto_table_name
}
