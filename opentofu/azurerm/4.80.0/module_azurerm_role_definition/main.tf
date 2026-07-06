resource "azurerm_role_definition" "role_definitions" {
  for_each = var.role_definitions

  name               = each.value.name
  scope              = each.value.scope
  assignable_scopes  = each.value.assignable_scopes
  description        = each.value.description
  role_definition_id = each.value.role_definition_id

  dynamic "permissions" {
    for_each = each.value.permissions != null ? each.value.permissions : []
    content {
      actions          = permissions.value.actions
      data_actions     = permissions.value.data_actions
      not_actions      = permissions.value.not_actions
      not_data_actions = permissions.value.not_data_actions
    }
  }
}
