resource "azurerm_maps_account" "maps_accounts" {
  for_each = var.maps_accounts

  location                     = each.value.location
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  sku_name                     = each.value.sku_name
  local_authentication_enabled = each.value.local_authentication_enabled
  tags                         = each.value.tags

  dynamic "cors" {
    for_each = each.value.cors != null ? each.value.cors : []
    content {
      allowed_origins = cors.value.allowed_origins
    }
  }

  dynamic "data_store" {
    for_each = each.value.data_store != null ? each.value.data_store : []
    content {
      unique_name        = data_store.value.unique_name
      storage_account_id = data_store.value.storage_account_id
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }
}
