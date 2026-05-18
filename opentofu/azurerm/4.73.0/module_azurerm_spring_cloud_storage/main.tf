resource "azurerm_spring_cloud_storage" "spring_cloud_storages" {
  for_each = var.spring_cloud_storages

  name                    = each.value.name
  spring_cloud_service_id = each.value.spring_cloud_service_id
  storage_account_key     = each.value.storage_account_key
  storage_account_name    = each.value.storage_account_name
}
