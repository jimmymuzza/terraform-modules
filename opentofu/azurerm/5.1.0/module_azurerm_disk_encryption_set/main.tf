resource "azurerm_disk_encryption_set" "disk_encryption_sets" {
  for_each = var.disk_encryption_sets

  key_vault_key_id          = each.value.key_vault_key_id
  location                  = each.value.location
  name                      = each.value.name
  resource_group_name       = each.value.resource_group_name
  auto_key_rotation_enabled = each.value.auto_key_rotation_enabled
  encryption_type           = each.value.encryption_type
  federated_client_id       = each.value.federated_client_id
  tags                      = each.value.tags

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }
}
