variable "api_gateway_gateway_responses" {
  description = <<EOT
Map of api_gateway_gateway_responses, attributes below
Required:
    - response_type
    - rest_api_id
Optional:
    - region
    - response_parameters
    - response_templates
    - status_code
EOT

  type = map(object({
    response_type       = string
    rest_api_id         = string
    region              = optional(string)
    response_parameters = optional(map(string))
    response_templates  = optional(map(string))
    status_code         = optional(string)
  }))
}
