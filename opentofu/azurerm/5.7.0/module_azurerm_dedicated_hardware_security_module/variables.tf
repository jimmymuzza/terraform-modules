variable "dedicated_hardware_security_modules" {
  description = <<EOT
Map of dedicated_hardware_security_modules, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sku_name
    - network_profile
Optional:
    - stamp_id
    - tags
    - zones
    - management_network_profile
EOT

  type = map(object({
    location                   = string
    name                       = string
    resource_group_name        = string
    sku_name                   = string
    stamp_id                   = optional(string)
    tags                       = optional(map(string))
    zones                      = optional(set(string))
    management_network_profile = optional(list(object({
            network_interface_private_ip_addresses = set(string)
            subnet_id                              = string
        })))
    network_profile            = list(object({
            network_interface_private_ip_addresses = set(string)
            subnet_id                              = string
        }))
  }))
}
