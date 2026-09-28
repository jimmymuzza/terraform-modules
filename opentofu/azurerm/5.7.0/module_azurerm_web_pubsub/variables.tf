variable "web_pubsubs" {
  description = <<EOT
Map of web_pubsubs, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sku
Optional:
    - aad_auth_enabled
    - capacity
    - local_auth_enabled
    - public_network_access_enabled
    - tags
    - tls_client_cert_enabled
    - identity
    - live_trace
EOT

  type = map(object({
    location                      = string
    name                          = string
    resource_group_name           = string
    sku                           = string
    aad_auth_enabled              = optional(bool)
    capacity                      = optional(number)
    local_auth_enabled            = optional(bool)
    public_network_access_enabled = optional(bool)
    tags                          = optional(map(string))
    tls_client_cert_enabled       = optional(bool)
    identity                      = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    live_trace                    = optional(list(object({
            connectivity_logs_enabled = optional(bool)
            enabled                   = optional(bool)
            http_request_logs_enabled = optional(bool)
            messaging_logs_enabled    = optional(bool)
        })))
  }))
}
