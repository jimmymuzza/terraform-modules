resource "azurerm_function_app_hybrid_connection" "function_app_hybrid_connections" {
  for_each = var.function_app_hybrid_connections

  function_app_id = each.value.function_app_id
  hostname        = each.value.hostname
  port            = each.value.port
  relay_id        = each.value.relay_id
  send_key_name   = each.value.send_key_name
}
