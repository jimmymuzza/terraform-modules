variable "arc_private_link_scopes" {
  description = <<EOT
Map of arc_private_link_scopes, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - public_network_access_enabled
    - tags
EOT

  type = map(object({
    location                      = string
    name                          = string
    resource_group_name           = string
    public_network_access_enabled = optional(bool)
    tags                          = optional(map(string))
  }))
}
