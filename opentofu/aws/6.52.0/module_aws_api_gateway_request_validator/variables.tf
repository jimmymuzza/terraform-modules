variable "api_gateway_request_validators" {
  description = <<EOT
Map of api_gateway_request_validators, attributes below
Required:
    - name
    - rest_api_id
Optional:
    - region
    - validate_request_body
    - validate_request_parameters
EOT

  type = map(object({
    name                        = string
    rest_api_id                 = string
    region                      = optional(string)
    validate_request_body       = optional(bool)
    validate_request_parameters = optional(bool)
  }))
}
