variable "virtual_desktop_application_groups" {
  description = <<EOT
Map of virtual_desktop_application_groups, attributes below
Required:
    - host_pool_id
    - location
    - name
    - resource_group_name
    - type
Optional:
    - default_desktop_display_name
    - description
    - friendly_name
    - tags
EOT

  type = map(object({
    host_pool_id                 = string
    location                     = string
    name                         = string
    resource_group_name          = string
    type                         = string
    default_desktop_display_name = optional(string)
    description                  = optional(string)
    friendly_name                = optional(string)
    tags                         = optional(map(string))
  }))
}
