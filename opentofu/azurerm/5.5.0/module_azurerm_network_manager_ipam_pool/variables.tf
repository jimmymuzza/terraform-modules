variable "network_manager_ipam_pools" {
  description = <<EOT
Map of network_manager_ipam_pools, attributes below
Required:
    - address_prefixes
    - location
    - name
    - network_manager_id
Optional:
    - description
    - display_name
    - parent_pool_name
    - tags
EOT

  type = map(object({
    address_prefixes   = list(string)
    location           = string
    name               = string
    network_manager_id = string
    description        = optional(string)
    display_name       = optional(string)
    parent_pool_name   = optional(string)
    tags               = optional(map(string))
  }))
}
