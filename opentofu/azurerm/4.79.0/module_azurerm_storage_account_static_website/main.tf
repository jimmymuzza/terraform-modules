resource "azurerm_storage_account_static_website" "storage_account_static_websites" {
  for_each = var.storage_account_static_websites

  storage_account_id = each.value.storage_account_id
  error_404_document = each.value.error_404_document
  index_document     = each.value.index_document
}
