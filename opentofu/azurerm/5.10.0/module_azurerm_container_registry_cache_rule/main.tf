resource "azurerm_container_registry_cache_rule" "container_registry_cache_rules" {
  for_each = var.container_registry_cache_rules

  container_registry_id = each.value.container_registry_id
  name                  = each.value.name
  source_repo           = each.value.source_repo
  target_repo           = each.value.target_repo
  credential_set_id     = each.value.credential_set_id
}
