resource "azurerm_web_app_active_slot" "web_app_active_slots" {
  for_each = var.web_app_active_slots

  slot_id                  = each.value.slot_id
  overwrite_network_config = each.value.overwrite_network_config
}
