resource "azurerm_logic_app_action_http" "logic_app_action_https" {
  for_each = var.logic_app_action_https

  logic_app_id = each.value.logic_app_id
  method       = each.value.method
  name         = each.value.name
  uri          = each.value.uri
  body         = each.value.body
  headers      = each.value.headers
  queries      = each.value.queries

  dynamic "run_after" {
    for_each = each.value.run_after != null ? each.value.run_after : []
    content {
      action_name   = run_after.value.action_name
      action_result = run_after.value.action_result
    }
  }
}
