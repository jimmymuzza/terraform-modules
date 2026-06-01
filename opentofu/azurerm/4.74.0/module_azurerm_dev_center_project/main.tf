resource "azurerm_dev_center_project" "dev_center_projects" {
  for_each = var.dev_center_projects

  dev_center_id              = each.value.dev_center_id
  location                   = each.value.location
  name                       = each.value.name
  resource_group_name        = each.value.resource_group_name
  description                = each.value.description
  maximum_dev_boxes_per_user = each.value.maximum_dev_boxes_per_user
  tags                       = each.value.tags

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }
}
