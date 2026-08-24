variable "api_gateway_domain_names" {
  description = <<EOT
Map of api_gateway_domain_names, attributes below
Required:
    - domain_name
Optional:
    - certificate_arn
    - certificate_body
    - certificate_chain
    - certificate_name
    - certificate_private_key
    - endpoint_access_mode
    - ownership_verification_certificate_arn
    - policy
    - region
    - regional_certificate_arn
    - regional_certificate_name
    - routing_mode
    - security_policy
    - tags
    - tags_all
    - endpoint_configuration
    - mutual_tls_authentication
EOT

  type = map(object({
    domain_name                            = string
    certificate_arn                        = optional(string)
    certificate_body                       = optional(string)
    certificate_chain                      = optional(string)
    certificate_name                       = optional(string)
    certificate_private_key                = optional(string)
    endpoint_access_mode                   = optional(string)
    ownership_verification_certificate_arn = optional(string)
    policy                                 = optional(string)
    region                                 = optional(string)
    regional_certificate_arn               = optional(string)
    regional_certificate_name              = optional(string)
    routing_mode                           = optional(string)
    security_policy                        = optional(string)
    tags                                   = optional(map(string))
    tags_all                               = optional(map(string))
    endpoint_configuration                 = optional(list(object({
            types           = list(string)
            ip_address_type = optional(string)
        })))
    mutual_tls_authentication              = optional(list(object({
            truststore_uri     = string
            truststore_version = optional(string)
        })))
  }))
}
