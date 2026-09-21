variable "api_gateway_method_responses" {
  description = <<EOT
Map of api_gateway_method_responses, attributes below
Required:
    - http_method
    - resource_id
    - rest_api_id
    - status_code
Optional:
    - region
    - response_models
    - response_parameters
EOT

  type = map(object({
    http_method         = string
    resource_id         = string
    rest_api_id         = string
    status_code         = string
    region              = optional(string)
    response_models     = optional(map(string))
    response_parameters = optional(map(bool))
  }))
}
