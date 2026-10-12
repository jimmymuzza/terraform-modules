resource "azurerm_virtual_machine_scale_set_extension" "virtual_machine_scale_set_extensions" {
  for_each = var.virtual_machine_scale_set_extensions

  name                         = each.value.name
  publisher                    = each.value.publisher
  type                         = each.value.type
  type_handler_version         = each.value.type_handler_version
  virtual_machine_scale_set_id = each.value.virtual_machine_scale_set_id
  auto_upgrade_minor_version   = each.value.auto_upgrade_minor_version
  automatic_upgrade_enabled    = each.value.automatic_upgrade_enabled
  failure_suppression_enabled  = each.value.failure_suppression_enabled
  force_update_tag             = each.value.force_update_tag
  protected_settings           = each.value.protected_settings
  provision_after_extensions   = each.value.provision_after_extensions
  settings                     = each.value.settings

  dynamic "protected_settings_from_key_vault" {
    for_each = each.value.protected_settings_from_key_vault != null ? each.value.protected_settings_from_key_vault : []
    content {
      secret_url      = protected_settings_from_key_vault.value.secret_url
      source_vault_id = protected_settings_from_key_vault.value.source_vault_id
    }
  }
}
