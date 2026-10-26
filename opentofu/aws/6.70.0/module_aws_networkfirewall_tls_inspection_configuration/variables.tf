variable "networkfirewall_tls_inspection_configurations" {
  description = <<EOT
Map of networkfirewall_tls_inspection_configurations, attributes below
Required:
    - name
Optional:
    - description
    - encryption_configuration
    - region
    - tags
    - tls_inspection_configuration
EOT

  type = map(object({
    name                         = string
    description                  = optional(string)
    encryption_configuration     = optional(list(object({
            key_id = string
            type = string
        })))
    region                       = optional(string)
    tags                         = optional(map(string))
    tls_inspection_configuration = optional(list(object({
            server_certificate_configuration = optional(list(object({
                certificate_authority_arn           = optional(string)
                check_certificate_revocation_status = optional(list(object({
                    revoked_status_action = optional(string)
                    unknown_status_action = optional(string)
                })))
                scope                               = optional(list(object({
                    protocols         = set(number)
                    destination       = optional(list(object({
                        address_definition = string
                    })))
                    destination_ports = optional(list(object({
                        from_port = number
                        to_port   = number
                    })))
                    source            = optional(list(object({
                        address_definition = string
                    })))
                    source_ports      = optional(list(object({
                        from_port = number
                        to_port   = number
                    })))
                })))
                server_certificate                  = optional(list(object({
                    resource_arn = optional(string)
                })))
            })))
        })))
  }))
}
