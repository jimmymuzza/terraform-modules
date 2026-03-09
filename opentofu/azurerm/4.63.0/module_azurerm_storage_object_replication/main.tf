resource "azurerm_storage_object_replication" "storage_object_replications" {
  for_each = var.storage_object_replications

  destination_storage_account_id = each.value.destination_storage_account_id
  source_storage_account_id      = each.value.source_storage_account_id

  dynamic "rules" {
    for_each = each.value.rules != null ? each.value.rules : []
    content {
      destination_container_name   = rules.value.destination_container_name
      source_container_name        = rules.value.source_container_name
      copy_blobs_created_after     = rules.value.copy_blobs_created_after
      filter_out_blobs_with_prefix = rules.value.filter_out_blobs_with_prefix
    }
  }
}
