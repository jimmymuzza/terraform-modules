variable "iotcentral_applications" {
  description = <<EOT
Map of iotcentral_applications, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sub_domain
Optional:
    - display_name
    - public_network_access_enabled
    - sku
    - tags
    - template
    - identity
EOT

  type = map(object({
    location                      = string
    name                          = string
    resource_group_name           = string
    sub_domain                    = string
    display_name                  = optional(string)
    public_network_access_enabled = optional(bool)
    sku                           = optional(string)
    tags                          = optional(map(string))
    template                      = optional(string)
    identity                      = optional(list(object({
            type = string
        })))
  }))
}
