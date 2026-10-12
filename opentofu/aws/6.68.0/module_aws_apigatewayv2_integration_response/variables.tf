variable "apigatewayv2_integration_responses" {
  description = <<EOT
Map of apigatewayv2_integration_responses, attributes below
Required:
    - api_id
    - integration_id
    - integration_response_key
Optional:
    - content_handling_strategy
    - region
    - response_templates
    - template_selection_expression
EOT

  type = map(object({
    api_id                        = string
    integration_id                = string
    integration_response_key      = string
    content_handling_strategy     = optional(string)
    region                        = optional(string)
    response_templates            = optional(map(string))
    template_selection_expression = optional(string)
  }))
}
