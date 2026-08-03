variable "vpclattice_resource_gateways" {
  description = <<EOT
Map of vpclattice_resource_gateways, attributes below
Required:
    - name
    - subnet_ids
    - vpc_id
Optional:
    - ip_address_type
    - ipv4_addresses_per_eni
    - region
    - resource_config_dns_resolution
    - security_group_ids
    - tags
EOT

  type = map(object({
    name                           = string
    subnet_ids                     = set(string)
    vpc_id                         = string
    ip_address_type                = optional(string)
    ipv4_addresses_per_eni         = optional(number)
    region                         = optional(string)
    resource_config_dns_resolution = optional(string)
    security_group_ids             = optional(set(string))
    tags                           = optional(map(string))
  }))
}
