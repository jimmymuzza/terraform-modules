resource "azurerm_dev_center" "dev_centers" {
  for_each = var.dev_centers

  location                          = each.value.location
  name                              = each.value.name
  resource_group_name               = each.value.resource_group_name
  project_catalog_item_sync_enabled = each.value.project_catalog_item_sync_enabled
  tags                              = each.value.tags

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }
}
