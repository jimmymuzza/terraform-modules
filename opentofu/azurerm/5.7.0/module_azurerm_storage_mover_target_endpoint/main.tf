resource "azurerm_storage_mover_target_endpoint" "storage_mover_target_endpoints" {
  for_each = var.storage_mover_target_endpoints

  name                   = each.value.name
  storage_account_id     = each.value.storage_account_id
  storage_container_name = each.value.storage_container_name
  storage_mover_id       = each.value.storage_mover_id
  description            = each.value.description
}
