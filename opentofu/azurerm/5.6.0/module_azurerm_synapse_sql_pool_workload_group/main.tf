resource "azurerm_synapse_sql_pool_workload_group" "synapse_sql_pool_workload_groups" {
  for_each = var.synapse_sql_pool_workload_groups

  max_resource_percent               = each.value.max_resource_percent
  min_resource_percent               = each.value.min_resource_percent
  name                               = each.value.name
  sql_pool_id                        = each.value.sql_pool_id
  importance                         = each.value.importance
  max_resource_percent_per_request   = each.value.max_resource_percent_per_request
  min_resource_percent_per_request   = each.value.min_resource_percent_per_request
  query_execution_timeout_in_seconds = each.value.query_execution_timeout_in_seconds
}
