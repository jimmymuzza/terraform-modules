resource "azurerm_logic_app_trigger_http_request" "logic_app_trigger_http_requests" {
  for_each = var.logic_app_trigger_http_requests

  logic_app_id  = each.value.logic_app_id
  name          = each.value.name
  schema        = each.value.schema
  method        = each.value.method
  relative_path = each.value.relative_path
}
