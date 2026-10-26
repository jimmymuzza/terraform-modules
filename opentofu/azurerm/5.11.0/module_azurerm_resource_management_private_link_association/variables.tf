variable "resource_management_private_link_associations" {
  description = <<EOT
Map of resource_management_private_link_associations, attributes below
Required:
    - management_group_id
    - public_network_access_enabled
    - resource_management_private_link_id
Optional:
    - name
EOT

  type = map(object({
    management_group_id                 = string
    public_network_access_enabled       = bool
    resource_management_private_link_id = string
    name                                = optional(string)
  }))
}
