resource "azurerm_log_analytics_linked_storage_account" "log_analytics_linked_storage_accounts" {
  for_each = var.log_analytics_linked_storage_accounts

  data_source_type      = each.value.data_source_type
  resource_group_name   = each.value.resource_group_name
  storage_account_ids   = each.value.storage_account_ids
  workspace_id          = each.value.workspace_id
  workspace_resource_id = each.value.workspace_resource_id
}
