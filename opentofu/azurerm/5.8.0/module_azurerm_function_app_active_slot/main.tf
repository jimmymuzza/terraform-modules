resource "azurerm_function_app_active_slot" "function_app_active_slots" {
  for_each = var.function_app_active_slots

  slot_id                  = each.value.slot_id
  overwrite_network_config = each.value.overwrite_network_config
}
