resource "azurerm_storage_share_directory" "storage_share_directories" {
  for_each = var.storage_share_directories

  name              = each.value.name
  storage_share_url = each.value.storage_share_url
  metadata          = each.value.metadata
}
