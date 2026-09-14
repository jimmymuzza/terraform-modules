resource "azurerm_storage_sync_cloud_endpoint" "storage_sync_cloud_endpoints" {
  for_each = var.storage_sync_cloud_endpoints

  file_share_name           = each.value.file_share_name
  name                      = each.value.name
  storage_account_id        = each.value.storage_account_id
  storage_sync_group_id     = each.value.storage_sync_group_id
  storage_account_tenant_id = each.value.storage_account_tenant_id
}
