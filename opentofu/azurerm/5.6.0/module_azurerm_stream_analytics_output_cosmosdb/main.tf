resource "azurerm_stream_analytics_output_cosmosdb" "stream_analytics_output_cosmosdbs" {
  for_each = var.stream_analytics_output_cosmosdbs

  container_name           = each.value.container_name
  cosmosdb_account_key     = each.value.cosmosdb_account_key
  cosmosdb_sql_database_id = each.value.cosmosdb_sql_database_id
  name                     = each.value.name
  stream_analytics_job_id  = each.value.stream_analytics_job_id
  authentication_mode      = each.value.authentication_mode
  document_id              = each.value.document_id
  partition_key            = each.value.partition_key
}
