variable "api_management_api_version_sets" {
  description = <<EOT
Map of api_management_api_version_sets, attributes below
Required:
    - api_management_name
    - display_name
    - name
    - resource_group_name
    - versioning_scheme
Optional:
    - description
    - version_header_name
    - version_query_name
EOT

  type = map(object({
    api_management_name = string
    display_name        = string
    name                = string
    resource_group_name = string
    versioning_scheme   = string
    description         = optional(string)
    version_header_name = optional(string)
    version_query_name  = optional(string)
  }))
}
