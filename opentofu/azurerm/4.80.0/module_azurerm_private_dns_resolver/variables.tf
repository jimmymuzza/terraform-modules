variable "private_dns_resolvers" {
  description = <<EOT
Map of private_dns_resolvers, attributes below
Required:
    - location
    - name
    - resource_group_name
    - virtual_network_id
Optional:
    - tags
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    virtual_network_id  = string
    tags                = optional(map(string))
  }))
}
