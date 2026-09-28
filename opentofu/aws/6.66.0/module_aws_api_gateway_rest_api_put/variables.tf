variable "api_gateway_rest_api_puts" {
  description = <<EOT
Map of api_gateway_rest_api_puts, attributes below
Required:
    - body
    - rest_api_id
Optional:
    - fail_on_warnings
    - parameters
    - region
    - triggers
EOT

  type = map(object({
    body             = string
    rest_api_id      = string
    fail_on_warnings = optional(bool)
    parameters       = optional(map(string))
    region           = optional(string)
    triggers         = optional(map(string))
  }))
}
