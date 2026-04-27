resource "azurerm_storage_queue" "storage_queues" {
  for_each = var.storage_queues

  name                 = each.value.name
  metadata             = each.value.metadata
  storage_account_id   = each.value.storage_account_id
  storage_account_name = each.value.storage_account_name
}
