variable "apigatewayv2_domain_names" {
  description = <<EOT
Map of apigatewayv2_domain_names, attributes below
Required:
    - domain_name
    - domain_name_configuration
Optional:
    - region
    - routing_mode
    - tags
    - tags_all
    - mutual_tls_authentication
EOT

  type = map(object({
    domain_name               = string
    region                    = optional(string)
    routing_mode              = optional(string)
    tags                      = optional(map(string))
    tags_all                  = optional(map(string))
    domain_name_configuration = list(object({
            certificate_arn                        = string
            endpoint_type                          = string
            security_policy                        = string
            ip_address_type                        = optional(string)
            ownership_verification_certificate_arn = optional(string)
        }))
    mutual_tls_authentication = optional(list(object({
            truststore_uri     = string
            truststore_version = optional(string)
        })))
  }))
}
