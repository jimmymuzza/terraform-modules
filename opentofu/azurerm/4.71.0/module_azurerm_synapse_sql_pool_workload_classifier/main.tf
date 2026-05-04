resource "azurerm_synapse_sql_pool_workload_classifier" "synapse_sql_pool_workload_classifiers" {
  for_each = var.synapse_sql_pool_workload_classifiers

  member_name       = each.value.member_name
  name              = each.value.name
  workload_group_id = each.value.workload_group_id
  context           = each.value.context
  end_time          = each.value.end_time
  importance        = each.value.importance
  label             = each.value.label
  start_time        = each.value.start_time
}
