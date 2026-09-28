variable "api_management_gateway_host_name_configurations" {
  description = <<EOT
Map of api_management_gateway_host_name_configurations, attributes below
Required:
    - api_management_id
    - certificate_id
    - gateway_name
    - host_name
    - name
Optional:
    - http2_enabled
    - request_client_certificate_enabled
    - tls10_enabled
    - tls11_enabled
EOT

  type = map(object({
    api_management_id                  = string
    certificate_id                     = string
    gateway_name                       = string
    host_name                          = string
    name                               = string
    http2_enabled                      = optional(bool)
    request_client_certificate_enabled = optional(bool)
    tls10_enabled                      = optional(bool)
    tls11_enabled                      = optional(bool)
  }))
}
