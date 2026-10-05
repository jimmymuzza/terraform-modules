resource "azurerm_network_manager" "network_managers" {
  for_each = var.network_managers

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  description         = each.value.description
  scope_accesses      = each.value.scope_accesses
  tags                = each.value.tags

  dynamic "scope" {
    for_each = each.value.scope != null ? each.value.scope : []
    content {
      management_group_ids = scope.value.management_group_ids
      subscription_ids     = scope.value.subscription_ids
    }
  }
}
