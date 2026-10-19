resource "azurerm_logic_app_trigger_custom" "logic_app_trigger_customs" {
  for_each = var.logic_app_trigger_customs

  body         = each.value.body
  logic_app_id = each.value.logic_app_id
  name         = each.value.name
}
