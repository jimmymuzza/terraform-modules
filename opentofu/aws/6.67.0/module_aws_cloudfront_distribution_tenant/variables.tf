variable "cloudfront_distribution_tenants" {
  description = <<EOT
Map of cloudfront_distribution_tenants, attributes below
Required:
    - distribution_id
    - name
Optional:
    - connection_group_id
    - enabled
    - tags
    - wait_for_deployment
    - customizations
    - domain
    - managed_certificate_request
    - parameter
EOT

  type = map(object({
    distribution_id             = string
    name                        = string
    connection_group_id         = optional(string)
    enabled                     = optional(bool)
    tags                        = optional(map(string))
    wait_for_deployment         = optional(bool)
    customizations              = optional(list(object({
            certificate     = optional(list(object({
                arn = optional(string)
            })))
            geo_restriction = optional(list(object({
                locations        = optional(set(string))
                restriction_type = optional(string)
            })))
            web_acl         = optional(list(object({
                action = optional(string)
                arn    = optional(string)
            })))
        })))
    domain                      = optional(set(object({
            domain = string
        })))
    managed_certificate_request = optional(list(object({
            certificate_transparency_logging_preference = optional(string)
            primary_domain_name                         = optional(string)
            validation_token_host                       = optional(string)
        })))
    parameter                   = optional(set(object({
            name  = string
            value = string
        })))
  }))
}
