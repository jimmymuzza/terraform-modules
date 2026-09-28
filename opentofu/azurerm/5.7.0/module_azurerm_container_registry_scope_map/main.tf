resource "azurerm_container_registry_scope_map" "container_registry_scope_maps" {
  for_each = var.container_registry_scope_maps

  actions                 = each.value.actions
  container_registry_name = each.value.container_registry_name
  name                    = each.value.name
  resource_group_name     = each.value.resource_group_name
  description             = each.value.description
}
