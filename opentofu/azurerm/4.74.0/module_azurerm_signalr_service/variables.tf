variable "signalr_services" {
  description = <<EOT
Map of signalr_services, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sku
Optional:
    - aad_auth_enabled
    - connectivity_logs_enabled
    - http_request_logs_enabled
    - live_trace_enabled
    - local_auth_enabled
    - messaging_logs_enabled
    - public_network_access_enabled
    - serverless_connection_timeout_in_seconds
    - service_mode
    - tags
    - tls_client_cert_enabled
    - cors
    - identity
    - live_trace
    - upstream_endpoint
EOT

  type = map(object({
    location                                 = string
    name                                     = string
    resource_group_name                      = string
    aad_auth_enabled                         = optional(bool)
    connectivity_logs_enabled                = optional(bool)
    http_request_logs_enabled                = optional(bool)
    live_trace_enabled                       = optional(bool)
    local_auth_enabled                       = optional(bool)
    messaging_logs_enabled                   = optional(bool)
    public_network_access_enabled            = optional(bool)
    serverless_connection_timeout_in_seconds = optional(number)
    service_mode                             = optional(string)
    tags                                     = optional(map(string))
    tls_client_cert_enabled                  = optional(bool)
    cors                                     = optional(list(object({
            allowed_origins = set(string)
        })))
    identity                                 = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    live_trace                               = optional(list(object({
            connectivity_logs_enabled = optional(bool)
            enabled                   = optional(bool)
            http_request_logs_enabled = optional(bool)
            messaging_logs_enabled    = optional(bool)
        })))
    sku                                      = list(object({
            capacity = number
            name     = string
        }))
    upstream_endpoint                        = optional(set(object({
            category_pattern          = list(string)
            event_pattern             = list(string)
            hub_pattern               = list(string)
            url_template              = string
            user_assigned_identity_id = optional(string)
        })))
  }))
}
