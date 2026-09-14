variable "route_servers" {
  description = <<EOT
Map of route_servers, attributes below
Required:
    - location
    - name
    - public_ip_address_id
    - resource_group_name
    - sku
    - subnet_id
Optional:
    - branch_to_branch_traffic_enabled
    - hub_routing_preference
    - tags
EOT

  type = map(object({
    location                         = string
    name                             = string
    public_ip_address_id             = string
    resource_group_name              = string
    sku                              = string
    subnet_id                        = string
    branch_to_branch_traffic_enabled = optional(bool)
    hub_routing_preference           = optional(string)
    tags                             = optional(map(string))
  }))
}
