resource "azurerm_storage_table_entity" "storage_table_entities" {
  for_each = var.storage_table_entities

  entity           = each.value.entity
  partition_key    = each.value.partition_key
  row_key          = each.value.row_key
  storage_table_id = each.value.storage_table_id
}
