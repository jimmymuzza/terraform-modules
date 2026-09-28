variable "stack_hci_network_interfaces" {
  description = <<EOT
Map of stack_hci_network_interfaces, attributes below
Required:
    - custom_location_id
    - location
    - name
    - resource_group_name
    - ip_configuration
Optional:
    - dns_servers
    - mac_address
    - tags
EOT

  type = map(object({
    custom_location_id  = string
    location            = string
    name                = string
    resource_group_name = string
    dns_servers         = optional(list(string))
    mac_address         = optional(string)
    tags                = optional(map(string))
    ip_configuration    = list(object({
            subnet_id          = string
            private_ip_address = optional(string)
        }))
  }))
}
