resource "azurerm_storage_discovery_workspace" "storage_discovery_workspaces" {
  for_each = var.storage_discovery_workspaces

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  workspace_roots     = each.value.workspace_roots
  description         = each.value.description
  sku                 = each.value.sku
  tags                = each.value.tags

  dynamic "scope" {
    for_each = each.value.scope != null ? each.value.scope : []
    content {
      display_name   = scope.value.display_name
      resource_types = scope.value.resource_types
      tag_keys_only  = scope.value.tag_keys_only
      tags           = scope.value.tags
    }
  }
}
