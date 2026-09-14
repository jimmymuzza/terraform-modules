resource "azurerm_data_protection_backup_vault" "data_protection_backup_vaults" {
  for_each = var.data_protection_backup_vaults

  datastore_type               = each.value.datastore_type
  location                     = each.value.location
  name                         = each.value.name
  redundancy                   = each.value.redundancy
  resource_group_name          = each.value.resource_group_name
  cross_region_restore_enabled = each.value.cross_region_restore_enabled
  immutability                 = each.value.immutability
  retention_duration_in_days   = each.value.retention_duration_in_days
  soft_delete                  = each.value.soft_delete
  tags                         = each.value.tags

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }
}
