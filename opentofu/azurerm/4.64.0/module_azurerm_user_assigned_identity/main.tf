resource "azurerm_user_assigned_identity" "user_assigned_identities" {
  for_each = var.user_assigned_identities

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  isolation_scope     = each.value.isolation_scope
  tags                = each.value.tags
}
