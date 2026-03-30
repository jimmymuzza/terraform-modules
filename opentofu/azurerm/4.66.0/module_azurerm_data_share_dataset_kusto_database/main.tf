resource "azurerm_data_share_dataset_kusto_database" "data_share_dataset_kusto_databases" {
  for_each = var.data_share_dataset_kusto_databases

  kusto_database_id = each.value.kusto_database_id
  name              = each.value.name
  share_id          = each.value.share_id
}
