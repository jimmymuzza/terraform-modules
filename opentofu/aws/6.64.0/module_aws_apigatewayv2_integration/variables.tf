variable "apigatewayv2_integrations" {
  description = <<EOT
Map of apigatewayv2_integrations, attributes below
Required:
    - api_id
    - integration_type
Optional:
    - connection_id
    - connection_type
    - content_handling_strategy
    - credentials_arn
    - description
    - integration_method
    - integration_subtype
    - integration_uri
    - passthrough_behavior
    - payload_format_version
    - region
    - request_parameters
    - request_templates
    - template_selection_expression
    - timeout_milliseconds
    - response_parameters
    - tls_config
EOT

  type = map(object({
    api_id                        = string
    integration_type              = string
    connection_id                 = optional(string)
    connection_type               = optional(string)
    content_handling_strategy     = optional(string)
    credentials_arn               = optional(string)
    description                   = optional(string)
    integration_method            = optional(string)
    integration_subtype           = optional(string)
    integration_uri               = optional(string)
    passthrough_behavior          = optional(string)
    payload_format_version        = optional(string)
    region                        = optional(string)
    request_parameters            = optional(map(string))
    request_templates             = optional(map(string))
    template_selection_expression = optional(string)
    timeout_milliseconds          = optional(number)
    response_parameters           = optional(set(object({
            mappings    = map(string)
            status_code = string
        })))
    tls_config                    = optional(list(object({
            server_name_to_verify = optional(string)
        })))
  }))
}
