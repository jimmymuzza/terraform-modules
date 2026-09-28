variable "api_management_groups" {
  description = <<EOT
Map of api_management_groups, attributes below
Required:
    - api_management_name
    - display_name
    - name
    - resource_group_name
Optional:
    - description
    - external_id
    - type
EOT

  type = map(object({
    api_management_name = string
    display_name        = string
    name                = string
    resource_group_name = string
    description         = optional(string)
    external_id         = optional(string)
    type                = optional(string)
  }))
}
