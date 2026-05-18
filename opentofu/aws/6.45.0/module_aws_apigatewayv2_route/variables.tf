variable "apigatewayv2_routes" {
  description = <<EOT
Map of apigatewayv2_routes, attributes below
Required:
    - api_id
    - route_key
Optional:
    - api_key_required
    - authorization_scopes
    - authorization_type
    - authorizer_id
    - model_selection_expression
    - operation_name
    - region
    - request_models
    - route_response_selection_expression
    - target
    - request_parameter
EOT

  type = map(object({
    api_id                              = string
    route_key                           = string
    api_key_required                    = optional(bool)
    authorization_scopes                = optional(set(string))
    authorization_type                  = optional(string)
    authorizer_id                       = optional(string)
    model_selection_expression          = optional(string)
    operation_name                      = optional(string)
    region                              = optional(string)
    request_models                      = optional(map(string))
    route_response_selection_expression = optional(string)
    target                              = optional(string)
    request_parameter                   = optional(set(object({
            request_parameter_key = string
            required              = bool
        })))
  }))
}
