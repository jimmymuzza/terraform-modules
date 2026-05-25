variable "custom_ip_prefixes" {
  description = <<EOT
Map of custom_ip_prefixes, attributes below
Required:
    - cidr
    - location
    - name
    - resource_group_name
Optional:
    - commissioning_enabled
    - internet_advertising_disabled
    - parent_custom_ip_prefix_id
    - roa_validity_end_date
    - tags
    - wan_validation_signed_message
    - zones
EOT

  type = map(object({
    cidr                          = string
    location                      = string
    name                          = string
    resource_group_name           = string
    commissioning_enabled         = optional(bool)
    internet_advertising_disabled = optional(bool)
    parent_custom_ip_prefix_id    = optional(string)
    roa_validity_end_date         = optional(string)
    tags                          = optional(map(string))
    wan_validation_signed_message = optional(string)
    zones                         = optional(set(string))
  }))
}
