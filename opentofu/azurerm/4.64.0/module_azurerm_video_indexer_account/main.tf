resource "azurerm_video_indexer_account" "video_indexer_accounts" {
  for_each = var.video_indexer_accounts

  location              = each.value.location
  name                  = each.value.name
  resource_group_name   = each.value.resource_group_name
  public_network_access = each.value.public_network_access
  tags                  = each.value.tags

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "storage" {
    for_each = each.value.storage != null ? each.value.storage : []
    content {
      storage_account_id        = storage.value.storage_account_id
      user_assigned_identity_id = storage.value.user_assigned_identity_id
    }
  }
}
