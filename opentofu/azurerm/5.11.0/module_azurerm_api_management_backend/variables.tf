variable "api_management_backends" {
  description = <<EOT
Map of api_management_backends, attributes below
Required:
    - api_management_name
    - name
    - protocol
    - resource_group_name
    - url
Optional:
    - description
    - resource_id
    - title
    - circuit_breaker_rule
    - credentials
    - proxy
    - service_fabric_cluster
    - tls
EOT

  type = map(object({
    api_management_name    = string
    name                   = string
    protocol               = string
    resource_group_name    = string
    url                    = string
    description            = optional(string)
    resource_id            = optional(string)
    title                  = optional(string)
    circuit_breaker_rule   = optional(list(object({
            name                       = string
            trip_duration              = string
            accept_retry_after_enabled = optional(bool)
            failure_condition          = list(object({
                interval_duration = string
                count             = optional(number)
                error_reasons     = optional(list(string))
                percentage        = optional(number)
                status_code_range = optional(list(object({
                    max = number
                    min = number
                })))
            }))
        })))
    credentials            = optional(list(object({
            certificate   = optional(list(string))
            header        = optional(map(string))
            query         = optional(map(string))
            authorization = optional(list(object({
                parameter = optional(string)
                scheme    = optional(string)
            })))
        })))
    proxy                  = optional(list(object({
            url      = string
            password = optional(string)
            username = optional(string)
        })))
    service_fabric_cluster = optional(list(object({
            management_endpoints             = set(string)
            max_partition_resolution_retries = number
            client_certificate_id            = optional(string)
            client_certificate_thumbprint    = optional(string)
            server_certificate_thumbprints   = optional(set(string))
            server_x509_name                 = optional(set(object({
                issuer_certificate_thumbprint = string
                name                          = string
            })))
        })))
    tls                    = optional(list(object({
            validate_certificate_chain = optional(bool)
            validate_certificate_name  = optional(bool)
        })))
  }))
}
