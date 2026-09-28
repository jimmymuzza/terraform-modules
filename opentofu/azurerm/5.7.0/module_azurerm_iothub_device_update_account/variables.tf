variable "iothub_device_update_accounts" {
  description = <<EOT
Map of iothub_device_update_accounts, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - public_network_access_enabled
    - sku
    - tags
    - identity
EOT

  type = map(object({
    location                      = string
    name                          = string
    resource_group_name           = string
    public_network_access_enabled = optional(bool)
    sku                           = optional(string)
    tags                          = optional(map(string))
    identity                      = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
  }))
}
