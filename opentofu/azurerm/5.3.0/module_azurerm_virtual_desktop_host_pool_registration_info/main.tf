resource "azurerm_virtual_desktop_host_pool_registration_info" "virtual_desktop_host_pool_registration_infos" {
  for_each = var.virtual_desktop_host_pool_registration_infos

  expiration_date = each.value.expiration_date
  hostpool_id     = each.value.hostpool_id
}
