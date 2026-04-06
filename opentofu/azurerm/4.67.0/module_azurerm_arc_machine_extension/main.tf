resource "azurerm_arc_machine_extension" "arc_machine_extensions" {
  for_each = var.arc_machine_extensions

  arc_machine_id            = each.value.arc_machine_id
  location                  = each.value.location
  name                      = each.value.name
  publisher                 = each.value.publisher
  type                      = each.value.type
  automatic_upgrade_enabled = each.value.automatic_upgrade_enabled
  force_update_tag          = each.value.force_update_tag
  protected_settings        = each.value.protected_settings
  settings                  = each.value.settings
  tags                      = each.value.tags
  type_handler_version      = each.value.type_handler_version
}
