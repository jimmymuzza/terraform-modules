resource "azurerm_kusto_eventgrid_data_connection" "kusto_eventgrid_data_connections" {
  for_each = var.kusto_eventgrid_data_connections

  cluster_name                    = each.value.cluster_name
  database_name                   = each.value.database_name
  eventhub_consumer_group_name    = each.value.eventhub_consumer_group_name
  eventhub_id                     = each.value.eventhub_id
  location                        = each.value.location
  name                            = each.value.name
  resource_group_name             = each.value.resource_group_name
  storage_account_id              = each.value.storage_account_id
  blob_storage_event_type         = each.value.blob_storage_event_type
  data_format                     = each.value.data_format
  database_routing_type           = each.value.database_routing_type
  eventgrid_event_subscription_id = each.value.eventgrid_event_subscription_id
  managed_identity_id             = each.value.managed_identity_id
  mapping_rule_name               = each.value.mapping_rule_name
  skip_first_record               = each.value.skip_first_record
  table_name                      = each.value.table_name
}
