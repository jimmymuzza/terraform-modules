resource "azurerm_container_app_environment_storage" "container_app_environment_storages" {
  for_each = var.container_app_environment_storages

  access_mode                  = each.value.access_mode
  container_app_environment_id = each.value.container_app_environment_id
  name                         = each.value.name
  share_name                   = each.value.share_name
  access_key                   = each.value.access_key
  account_name                 = each.value.account_name
  nfs_server_url               = each.value.nfs_server_url
}
