variable "stack_hci_logical_networks" {
  description = <<EOT
Map of stack_hci_logical_networks, attributes below
Required:
    - custom_location_id
    - location
    - name
    - resource_group_name
    - virtual_switch_name
    - subnet
Optional:
    - dns_servers
    - tags
EOT

  type = map(object({
    custom_location_id  = string
    location            = string
    name                = string
    resource_group_name = string
    virtual_switch_name = string
    dns_servers         = optional(list(string))
    tags                = optional(map(string))
    subnet              = list(object({
            ip_allocation_method = string
            address_prefix       = optional(string)
            vlan_id              = optional(number)
            ip_pool              = optional(list(object({
                end   = string
                start = string
            })))
            route                = optional(list(object({
                address_prefix      = string
                next_hop_ip_address = string
                name                = optional(string)
            })))
        }))
  }))
}
