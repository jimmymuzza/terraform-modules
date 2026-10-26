variable "finspace_kx_environments" {
  description = <<EOT
Map of finspace_kx_environments, attributes below
Required:
    - kms_key_id
    - name
Optional:
    - description
    - region
    - tags
    - tags_all
    - custom_dns_configuration
    - transit_gateway_configuration
EOT

  type = map(object({
    kms_key_id                    = string
    name                          = string
    description                   = optional(string)
    region                        = optional(string)
    tags                          = optional(map(string))
    tags_all                      = optional(map(string))
    custom_dns_configuration      = optional(list(object({
            custom_dns_server_ip   = string
            custom_dns_server_name = string
        })))
    transit_gateway_configuration = optional(list(object({
            routable_cidr_space                  = string
            transit_gateway_id                   = string
            attachment_network_acl_configuration = optional(list(object({
                cidr_block     = string
                protocol       = string
                rule_action    = string
                rule_number    = number
                icmp_type_code = optional(list(object({
                    code = number
                    type = number
                })))
                port_range     = optional(list(object({
                    from = number
                    to   = number
                })))
            })))
        })))
  }))
}
