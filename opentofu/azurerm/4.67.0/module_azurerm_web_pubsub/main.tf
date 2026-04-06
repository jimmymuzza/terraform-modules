resource "azurerm_web_pubsub" "web_pubsubs" {
  for_each = var.web_pubsubs

  location                      = each.value.location
  name                          = each.value.name
  resource_group_name           = each.value.resource_group_name
  sku                           = each.value.sku
  aad_auth_enabled              = each.value.aad_auth_enabled
  capacity                      = each.value.capacity
  local_auth_enabled            = each.value.local_auth_enabled
  public_network_access_enabled = each.value.public_network_access_enabled
  tags                          = each.value.tags
  tls_client_cert_enabled       = each.value.tls_client_cert_enabled

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "live_trace" {
    for_each = each.value.live_trace != null ? each.value.live_trace : []
    content {
      connectivity_logs_enabled = live_trace.value.connectivity_logs_enabled
      enabled                   = live_trace.value.enabled
      http_request_logs_enabled = live_trace.value.http_request_logs_enabled
      messaging_logs_enabled    = live_trace.value.messaging_logs_enabled
    }
  }
}
