variable "api_management_workspace_policy_fragments" {
  description = <<EOT
Map of api_management_workspace_policy_fragments, attributes below
Required:
    - api_management_workspace_id
    - name
    - xml_content
Optional:
    - description
    - xml_format
EOT

  type = map(object({
    api_management_workspace_id = string
    name                        = string
    xml_content                 = string
    description                 = optional(string)
    xml_format                  = optional(string)
  }))
}
