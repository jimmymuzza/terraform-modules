variable "network_manager_ipam_pool_static_cidrs" {
  description = <<EOT
Map of network_manager_ipam_pool_static_cidrs, attributes below
Required:
    - ipam_pool_id
    - name
Optional:
    - address_prefixes
    - number_of_ip_addresses_to_allocate
EOT

  type = map(object({
    ipam_pool_id                       = string
    name                               = string
    address_prefixes                   = optional(list(string))
    number_of_ip_addresses_to_allocate = optional(string)
  }))
}
