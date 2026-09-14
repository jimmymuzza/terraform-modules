resource "azurerm_web_app_hybrid_connection" "web_app_hybrid_connections" {
  for_each = var.web_app_hybrid_connections

  hostname      = each.value.hostname
  port          = each.value.port
  relay_id      = each.value.relay_id
  web_app_id    = each.value.web_app_id
  send_key_name = each.value.send_key_name
}
