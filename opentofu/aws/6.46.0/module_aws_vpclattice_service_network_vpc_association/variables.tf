variable "vpclattice_service_network_vpc_associations" {
  description = <<EOT
Map of vpclattice_service_network_vpc_associations, attributes below
Required:
    - service_network_identifier
    - vpc_identifier
Optional:
    - private_dns_enabled
    - region
    - security_group_ids
    - tags
    - tags_all
    - dns_options
EOT

  type = map(object({
    service_network_identifier = string
    vpc_identifier             = string
    private_dns_enabled        = optional(bool)
    region                     = optional(string)
    security_group_ids         = optional(list(string))
    tags                       = optional(map(string))
    tags_all                   = optional(map(string))
    dns_options                = optional(list(object({
            private_dns_preference        = optional(string)
            private_dns_specified_domains = optional(set(string))
        })))
  }))
}
