resource "azurerm_container_registry_token" "container_registry_tokens" {
  for_each = var.container_registry_tokens

  container_registry_name = each.value.container_registry_name
  name                    = each.value.name
  resource_group_name     = each.value.resource_group_name
  scope_map_id            = each.value.scope_map_id
  enabled                 = each.value.enabled
}
