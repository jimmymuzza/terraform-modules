variable "apigatewayv2_authorizers" {
  description = <<EOT
Map of apigatewayv2_authorizers, attributes below
Required:
    - api_id
    - authorizer_type
    - name
Optional:
    - authorizer_credentials_arn
    - authorizer_payload_format_version
    - authorizer_result_ttl_in_seconds
    - authorizer_uri
    - enable_simple_responses
    - identity_sources
    - region
    - jwt_configuration
EOT

  type = map(object({
    api_id                            = string
    authorizer_type                   = string
    name                              = string
    authorizer_credentials_arn        = optional(string)
    authorizer_payload_format_version = optional(string)
    authorizer_result_ttl_in_seconds  = optional(number)
    authorizer_uri                    = optional(string)
    enable_simple_responses           = optional(bool)
    identity_sources                  = optional(set(string))
    region                            = optional(string)
    jwt_configuration                 = optional(list(object({
            audience = optional(set(string))
            issuer   = optional(string)
        })))
  }))
}
