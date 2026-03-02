variable "vpclattice_resource_configurations" {
  description = <<EOT
Map of vpclattice_resource_configurations, attributes below
Required:
    - name
Optional:
    - allow_association_to_shareable_service_network
    - custom_domain_name
    - domain_verification_id
    - port_ranges
    - protocol
    - region
    - resource_configuration_group_id
    - resource_gateway_identifier
    - tags
    - type
    - resource_configuration_definition
EOT

  type = map(object({
    name                                           = string
    allow_association_to_shareable_service_network = optional(bool)
    custom_domain_name                             = optional(string)
    domain_verification_id                         = optional(string)
    port_ranges                                    = optional(set(string))
    protocol                                       = optional(string)
    region                                         = optional(string)
    resource_configuration_group_id                = optional(string)
    resource_gateway_identifier                    = optional(string)
    tags                                           = optional(map(string))
    type                                           = optional(string)
    resource_configuration_definition              = optional(list(object({
            arn_resource = optional(list(object({
                arn = string
            })))
            dns_resource = optional(list(object({
                domain_name     = string
                ip_address_type = string
            })))
            ip_resource  = optional(list(object({
                ip_address = string
            })))
        })))
  }))
}
