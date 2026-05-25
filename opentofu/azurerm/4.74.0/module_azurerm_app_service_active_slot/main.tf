resource "azurerm_app_service_active_slot" "app_service_active_slots" {
  for_each = var.app_service_active_slots

  app_service_name      = each.value.app_service_name
  app_service_slot_name = each.value.app_service_slot_name
  resource_group_name   = each.value.resource_group_name
}
