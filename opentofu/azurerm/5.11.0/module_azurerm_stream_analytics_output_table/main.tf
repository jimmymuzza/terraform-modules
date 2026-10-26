resource "azurerm_stream_analytics_output_table" "stream_analytics_output_tables" {
  for_each = var.stream_analytics_output_tables

  batch_size                = each.value.batch_size
  name                      = each.value.name
  partition_key             = each.value.partition_key
  resource_group_name       = each.value.resource_group_name
  row_key                   = each.value.row_key
  storage_account_key       = each.value.storage_account_key
  storage_account_name      = each.value.storage_account_name
  stream_analytics_job_name = each.value.stream_analytics_job_name
  table                     = each.value.table
  columns_to_remove         = each.value.columns_to_remove
}
