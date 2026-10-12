variable "apigatewayv2_route_responses" {
  description = <<EOT
Map of apigatewayv2_route_responses, attributes below
Required:
    - api_id
    - route_id
    - route_response_key
Optional:
    - model_selection_expression
    - region
    - response_models
EOT

  type = map(object({
    api_id                     = string
    route_id                   = string
    route_response_key         = string
    model_selection_expression = optional(string)
    region                     = optional(string)
    response_models            = optional(map(string))
  }))
}
