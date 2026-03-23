variable "bastion_hosts" {
  description = <<EOT
Map of bastion_hosts, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - copy_paste_enabled
    - file_copy_enabled
    - ip_connect_enabled
    - kerberos_enabled
    - scale_units
    - session_recording_enabled
    - shareable_link_enabled
    - sku
    - tags
    - tunneling_enabled
    - virtual_network_id
    - zones
    - ip_configuration
EOT

  type = map(object({
    location                  = string
    name                      = string
    resource_group_name       = string
    copy_paste_enabled        = optional(bool)
    file_copy_enabled         = optional(bool)
    ip_connect_enabled        = optional(bool)
    kerberos_enabled          = optional(bool)
    scale_units               = optional(number)
    session_recording_enabled = optional(bool)
    shareable_link_enabled    = optional(bool)
    sku                       = optional(string)
    tags                      = optional(map(string))
    tunneling_enabled         = optional(bool)
    virtual_network_id        = optional(string)
    zones                     = optional(set(string))
    ip_configuration          = optional(list(object({
            name                 = string
            public_ip_address_id = string
            subnet_id            = string
        })))
  }))
}
