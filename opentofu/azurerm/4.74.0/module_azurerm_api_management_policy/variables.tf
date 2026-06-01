variable "api_management_policies" {
  description = <<EOT
Map of api_management_policies, attributes below
Required:
    - api_management_id
Optional:
    - xml_content
    - xml_link
EOT

  type = map(object({
    api_management_id = string
    xml_content       = optional(string)
    xml_link          = optional(string)
  }))
}
