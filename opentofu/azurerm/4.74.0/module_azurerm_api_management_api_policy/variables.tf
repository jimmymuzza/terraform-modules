variable "api_management_api_policies" {
  description = <<EOT
Map of api_management_api_policies, attributes below
Required:
    - api_management_name
    - api_name
    - resource_group_name
Optional:
    - xml_content
    - xml_link
EOT

  type = map(object({
    api_management_name = string
    api_name            = string
    resource_group_name = string
    xml_content         = optional(string)
    xml_link            = optional(string)
  }))
}
