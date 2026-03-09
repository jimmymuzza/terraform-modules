variable "private_dns_zone_virtual_network_links" {
  description = <<EOT
Map of private_dns_zone_virtual_network_links, attributes below
Required:
    - name
    - private_dns_zone_name
    - resource_group_name
    - virtual_network_id
Optional:
    - registration_enabled
    - resolution_policy
    - tags
EOT

  type = map(object({
    name                  = string
    private_dns_zone_name = string
    resource_group_name   = string
    virtual_network_id    = string
    registration_enabled  = optional(bool)
    resolution_policy     = optional(string)
    tags                  = optional(map(string))
  }))
}
