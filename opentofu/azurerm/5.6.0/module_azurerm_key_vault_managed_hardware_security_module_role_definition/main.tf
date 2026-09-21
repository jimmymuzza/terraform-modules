resource "azurerm_key_vault_managed_hardware_security_module_role_definition" "key_vault_managed_hardware_security_module_role_definitions" {
  for_each = var.key_vault_managed_hardware_security_module_role_definitions

  managed_hsm_id = each.value.managed_hsm_id
  name           = each.value.name
  description    = each.value.description
  role_name      = each.value.role_name

  dynamic "permission" {
    for_each = each.value.permission != null ? each.value.permission : []
    content {
      actions          = permission.value.actions
      data_actions     = permission.value.data_actions
      not_actions      = permission.value.not_actions
      not_data_actions = permission.value.not_data_actions
    }
  }
}
