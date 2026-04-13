resource "azurerm_key_vault_managed_hardware_security_module_key" "key_vault_managed_hardware_security_module_keys" {
  for_each = var.key_vault_managed_hardware_security_module_keys

  key_opts        = each.value.key_opts
  key_type        = each.value.key_type
  managed_hsm_id  = each.value.managed_hsm_id
  name            = each.value.name
  curve           = each.value.curve
  expiration_date = each.value.expiration_date
  key_size        = each.value.key_size
  not_before_date = each.value.not_before_date
  tags            = each.value.tags
}
