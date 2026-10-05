variable "api_management_gateway_certificate_authorities" {
  description = <<EOT
Map of api_management_gateway_certificate_authorities, attributes below
Required:
    - api_management_id
    - certificate_name
    - gateway_name
Optional:
    - is_trusted
EOT

  type = map(object({
    api_management_id = string
    certificate_name  = string
    gateway_name      = string
    is_trusted        = optional(bool)
  }))
}
