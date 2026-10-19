resource "azurerm_stack_hci_extension" "stack_hci_extensions" {
  for_each = var.stack_hci_extensions

  arc_setting_id                     = each.value.arc_setting_id
  name                               = each.value.name
  publisher                          = each.value.publisher
  type                               = each.value.type
  auto_upgrade_minor_version_enabled = each.value.auto_upgrade_minor_version_enabled
  automatic_upgrade_enabled          = each.value.automatic_upgrade_enabled
  protected_settings                 = each.value.protected_settings
  settings                           = each.value.settings
  type_handler_version               = each.value.type_handler_version
}
