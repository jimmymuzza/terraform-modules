resource "azurerm_key_vault_managed_hardware_security_module_role_assignment" "key_vault_managed_hardware_security_module_role_assignments" {
  for_each = var.key_vault_managed_hardware_security_module_role_assignments

  managed_hsm_id     = each.value.managed_hsm_id
  name               = each.value.name
  principal_id       = each.value.principal_id
  role_definition_id = each.value.role_definition_id
  scope              = each.value.scope
}
