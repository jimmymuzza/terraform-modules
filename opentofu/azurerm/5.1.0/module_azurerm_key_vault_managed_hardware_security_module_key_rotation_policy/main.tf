resource "azurerm_key_vault_managed_hardware_security_module_key_rotation_policy" "key_vault_managed_hardware_security_module_key_rotation_policies" {
  for_each = var.key_vault_managed_hardware_security_module_key_rotation_policies

  expire_after        = each.value.expire_after
  managed_hsm_key_id  = each.value.managed_hsm_key_id
  time_after_creation = each.value.time_after_creation
  time_before_expiry  = each.value.time_before_expiry
}
