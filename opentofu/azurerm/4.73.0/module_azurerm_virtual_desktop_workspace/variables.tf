variable "virtual_desktop_workspaces" {
  description = <<EOT
Map of virtual_desktop_workspaces, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - description
    - friendly_name
    - public_network_access_enabled
    - tags
EOT

  type = map(object({
    location                      = string
    name                          = string
    resource_group_name           = string
    description                   = optional(string)
    friendly_name                 = optional(string)
    public_network_access_enabled = optional(bool)
    tags                          = optional(map(string))
  }))
}
