variable "api_gateway_integrations" {
  description = <<EOT
Map of api_gateway_integrations, attributes below
Required:
    - http_method
    - resource_id
    - rest_api_id
    - type
Optional:
    - cache_key_parameters
    - cache_namespace
    - connection_id
    - connection_type
    - content_handling
    - credentials
    - integration_http_method
    - integration_target
    - passthrough_behavior
    - region
    - request_parameters
    - request_templates
    - response_transfer_mode
    - timeout_milliseconds
    - uri
    - tls_config
EOT

  type = map(object({
    http_method             = string
    resource_id             = string
    rest_api_id             = string
    type                    = string
    cache_key_parameters    = optional(set(string))
    cache_namespace         = optional(string)
    connection_id           = optional(string)
    connection_type         = optional(string)
    content_handling        = optional(string)
    credentials             = optional(string)
    integration_http_method = optional(string)
    integration_target      = optional(string)
    passthrough_behavior    = optional(string)
    region                  = optional(string)
    request_parameters      = optional(map(string))
    request_templates       = optional(map(string))
    response_transfer_mode  = optional(string)
    timeout_milliseconds    = optional(number)
    uri                     = optional(string)
    tls_config              = optional(list(object({
            insecure_skip_verification = optional(bool)
        })))
  }))
}
