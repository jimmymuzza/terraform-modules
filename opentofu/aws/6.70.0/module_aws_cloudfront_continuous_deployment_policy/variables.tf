variable "cloudfront_continuous_deployment_policies" {
  description = <<EOT
Map of cloudfront_continuous_deployment_policies, attributes below
Required:
    - enabled
Optional:
    - staging_distribution_dns_names
    - traffic_config
EOT

  type = map(object({
    enabled                        = bool
    staging_distribution_dns_names = optional(list(object({
            quantity = number
            items    = optional(set(string))
        })))
    traffic_config                 = optional(list(object({
            type                 = string
            single_header_config = optional(list(object({
                header = string
                value  = string
            })))
            single_weight_config = optional(list(object({
                weight                    = number
                session_stickiness_config = optional(list(object({
                    idle_ttl    = number
                    maximum_ttl = number
                })))
            })))
        })))
  }))
}
