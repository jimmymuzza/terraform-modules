resource "azurerm_data_share_dataset_blob_storage" "data_share_dataset_blob_storages" {
  for_each = var.data_share_dataset_blob_storages

  container_name = each.value.container_name
  data_share_id  = each.value.data_share_id
  name           = each.value.name
  file_path      = each.value.file_path
  folder_path    = each.value.folder_path

  dynamic "storage_account" {
    for_each = each.value.storage_account != null ? each.value.storage_account : []
    content {
      name                = storage_account.value.name
      resource_group_name = storage_account.value.resource_group_name
      subscription_id     = storage_account.value.subscription_id
    }
  }
}
