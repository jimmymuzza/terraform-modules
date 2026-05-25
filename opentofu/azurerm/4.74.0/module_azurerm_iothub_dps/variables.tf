variable "iothub_dps" {
  description = <<EOT
Map of iothub_dps, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sku
Optional:
    - allocation_policy
    - data_residency_enabled
    - public_network_access_enabled
    - tags
    - ip_filter_rule
    - linked_hub
EOT

  type = map(object({
    location                      = string
    name                          = string
    resource_group_name           = string
    allocation_policy             = optional(string)
    data_residency_enabled        = optional(bool)
    public_network_access_enabled = optional(bool)
    tags                          = optional(map(string))
    ip_filter_rule                = optional(list(object({
            action  = string
            ip_mask = string
            name    = string
            target  = optional(string)
        })))
    linked_hub                    = optional(list(object({
            connection_string       = string
            location                = string
            allocation_weight       = optional(number)
            apply_allocation_policy = optional(bool)
        })))
    sku                           = list(object({
            capacity = number
            name     = string
        }))
  }))
}
