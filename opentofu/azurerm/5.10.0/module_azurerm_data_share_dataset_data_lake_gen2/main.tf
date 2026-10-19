resource "azurerm_data_share_dataset_data_lake_gen2" "data_share_dataset_data_lake_gen2s" {
  for_each = var.data_share_dataset_data_lake_gen2s

  file_system_name   = each.value.file_system_name
  name               = each.value.name
  share_id           = each.value.share_id
  storage_account_id = each.value.storage_account_id
  file_path          = each.value.file_path
  folder_path        = each.value.folder_path
}
