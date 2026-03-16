resource "azurerm_snapshot" "snapshots" {
  for_each = var.snapshots

  create_option                 = each.value.create_option
  location                      = each.value.location
  name                          = each.value.name
  resource_group_name           = each.value.resource_group_name
  disk_access_id                = each.value.disk_access_id
  disk_size_gb                  = each.value.disk_size_gb
  incremental_enabled           = each.value.incremental_enabled
  network_access_policy         = each.value.network_access_policy
  public_network_access_enabled = each.value.public_network_access_enabled
  source_resource_id            = each.value.source_resource_id
  source_uri                    = each.value.source_uri
  storage_account_id            = each.value.storage_account_id
  tags                          = each.value.tags

  dynamic "encryption_settings" {
    for_each = each.value.encryption_settings != null ? each.value.encryption_settings : []
    content {

      dynamic "disk_encryption_key" {
        for_each = encryption_settings.value.disk_encryption_key != null ? encryption_settings.value.disk_encryption_key : []
        content {
          secret_url      = disk_encryption_key.value.secret_url
          source_vault_id = disk_encryption_key.value.source_vault_id
        }
      }

      dynamic "key_encryption_key" {
        for_each = encryption_settings.value.key_encryption_key != null ? encryption_settings.value.key_encryption_key : []
        content {
          key_url         = key_encryption_key.value.key_url
          source_vault_id = key_encryption_key.value.source_vault_id
        }
      }
    }
  }
}
