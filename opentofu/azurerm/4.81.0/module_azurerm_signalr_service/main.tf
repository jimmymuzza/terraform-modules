resource "azurerm_signalr_service" "signalr_services" {
  for_each = var.signalr_services

  location                                 = each.value.location
  name                                     = each.value.name
  resource_group_name                      = each.value.resource_group_name
  aad_auth_enabled                         = each.value.aad_auth_enabled
  connectivity_logs_enabled                = each.value.connectivity_logs_enabled
  http_request_logs_enabled                = each.value.http_request_logs_enabled
  live_trace_enabled                       = each.value.live_trace_enabled
  local_auth_enabled                       = each.value.local_auth_enabled
  messaging_logs_enabled                   = each.value.messaging_logs_enabled
  public_network_access_enabled            = each.value.public_network_access_enabled
  serverless_connection_timeout_in_seconds = each.value.serverless_connection_timeout_in_seconds
  service_mode                             = each.value.service_mode
  tags                                     = each.value.tags
  tls_client_cert_enabled                  = each.value.tls_client_cert_enabled

  dynamic "cors" {
    for_each = each.value.cors != null ? each.value.cors : []
    content {
      allowed_origins = cors.value.allowed_origins
    }
  }

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

  dynamic "sku" {
    for_each = each.value.sku != null ? each.value.sku : []
    content {
      capacity = sku.value.capacity
      name     = sku.value.name
    }
  }

  dynamic "upstream_endpoint" {
    for_each = each.value.upstream_endpoint != null ? each.value.upstream_endpoint : []
    content {
      category_pattern          = upstream_endpoint.value.category_pattern
      event_pattern             = upstream_endpoint.value.event_pattern
      hub_pattern               = upstream_endpoint.value.hub_pattern
      url_template              = upstream_endpoint.value.url_template
      user_assigned_identity_id = upstream_endpoint.value.user_assigned_identity_id
    }
  }
}
