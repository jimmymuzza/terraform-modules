variable "resource_management_private_links" {
  description = <<EOT
Map of resource_management_private_links, attributes below
Required:
    - location
    - name
    - resource_group_name
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
  }))
}
