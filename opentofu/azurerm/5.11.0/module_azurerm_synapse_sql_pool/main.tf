resource "azurerm_synapse_sql_pool" "synapse_sql_pools" {
  for_each = var.synapse_sql_pools

  name                      = each.value.name
  sku_name                  = each.value.sku_name
  storage_account_type      = each.value.storage_account_type
  synapse_workspace_id      = each.value.synapse_workspace_id
  collation                 = each.value.collation
  create_mode               = each.value.create_mode
  data_encrypted            = each.value.data_encrypted
  geo_backup_policy_enabled = each.value.geo_backup_policy_enabled
  recovery_database_id      = each.value.recovery_database_id
  tags                      = each.value.tags

  dynamic "restore" {
    for_each = each.value.restore != null ? each.value.restore : []
    content {
      point_in_time      = restore.value.point_in_time
      source_database_id = restore.value.source_database_id
    }
  }
}
