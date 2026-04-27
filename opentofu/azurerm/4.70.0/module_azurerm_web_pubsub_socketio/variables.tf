variable "web_pubsub_socketios" {
  description = <<EOT
Map of web_pubsub_socketios, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sku
Optional:
    - aad_auth_enabled
    - live_trace_connectivity_logs_enabled
    - live_trace_enabled
    - live_trace_http_request_logs_enabled
    - live_trace_messaging_logs_enabled
    - local_auth_enabled
    - public_network_access
    - service_mode
    - tags
    - tls_client_cert_enabled
    - identity
EOT

  type = map(object({
    location                             = string
    name                                 = string
    resource_group_name                  = string
    aad_auth_enabled                     = optional(bool)
    live_trace_connectivity_logs_enabled = optional(bool)
    live_trace_enabled                   = optional(bool)
    live_trace_http_request_logs_enabled = optional(bool)
    live_trace_messaging_logs_enabled    = optional(bool)
    local_auth_enabled                   = optional(bool)
    public_network_access                = optional(string)
    service_mode                         = optional(string)
    tags                                 = optional(map(string))
    tls_client_cert_enabled              = optional(bool)
    identity                             = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    sku                                  = list(object({
            name     = string
            capacity = optional(number)
        }))
  }))
}
