variable "vpclattice_service_network_resource_associations" {
  description = <<EOT
Map of vpclattice_service_network_resource_associations, attributes below
Required:
    - resource_configuration_identifier
    - service_network_identifier
Optional:
    - private_dns_enabled
    - region
    - tags
EOT

  type = map(object({
    resource_configuration_identifier = string
    service_network_identifier        = string
    private_dns_enabled               = optional(bool)
    region                            = optional(string)
    tags                              = optional(map(string))
  }))
}
