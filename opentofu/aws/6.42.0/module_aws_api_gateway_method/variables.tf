variable "api_gateway_methods" {
  description = <<EOT
Map of api_gateway_methods, attributes below
Required:
    - authorization
    - http_method
    - resource_id
    - rest_api_id
Optional:
    - api_key_required
    - authorization_scopes
    - authorizer_id
    - operation_name
    - region
    - request_models
    - request_parameters
    - request_validator_id
EOT

  type = map(object({
    authorization        = string
    http_method          = string
    resource_id          = string
    rest_api_id          = string
    api_key_required     = optional(bool)
    authorization_scopes = optional(set(string))
    authorizer_id        = optional(string)
    operation_name       = optional(string)
    region               = optional(string)
    request_models       = optional(map(string))
    request_parameters   = optional(map(bool))
    request_validator_id = optional(string)
  }))
}
