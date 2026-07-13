resource "azurerm_web_pubsub_socketio" "web_pubsub_socketios" {
  for_each = var.web_pubsub_socketios

  location                             = each.value.location
  name                                 = each.value.name
  resource_group_name                  = each.value.resource_group_name
  aad_auth_enabled                     = each.value.aad_auth_enabled
  live_trace_connectivity_logs_enabled = each.value.live_trace_connectivity_logs_enabled
  live_trace_enabled                   = each.value.live_trace_enabled
  live_trace_http_request_logs_enabled = each.value.live_trace_http_request_logs_enabled
  live_trace_messaging_logs_enabled    = each.value.live_trace_messaging_logs_enabled
  local_auth_enabled                   = each.value.local_auth_enabled
  public_network_access                = each.value.public_network_access
  service_mode                         = each.value.service_mode
  tags                                 = each.value.tags
  tls_client_cert_enabled              = each.value.tls_client_cert_enabled

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "sku" {
    for_each = each.value.sku != null ? each.value.sku : []
    content {
      name     = sku.value.name
      capacity = sku.value.capacity
    }
  }
}
