resource "azurerm_storage_data_lake_gen2_filesystem" "storage_data_lake_gen2_filesystems" {
  for_each = var.storage_data_lake_gen2_filesystems

  name                     = each.value.name
  storage_account_id       = each.value.storage_account_id
  default_encryption_scope = each.value.default_encryption_scope
  group                    = each.value.group
  owner                    = each.value.owner
  properties               = each.value.properties

  dynamic "ace" {
    for_each = each.value.ace != null ? each.value.ace : []
    content {
      permissions = ace.value.permissions
      type        = ace.value.type
      scope       = ace.value.scope
    }
  }
}
