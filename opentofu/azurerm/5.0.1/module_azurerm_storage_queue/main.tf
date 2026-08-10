resource "azurerm_storage_queue" "storage_queues" {
  for_each = var.storage_queues

  name               = each.value.name
  storage_account_id = each.value.storage_account_id
  metadata           = each.value.metadata
}
