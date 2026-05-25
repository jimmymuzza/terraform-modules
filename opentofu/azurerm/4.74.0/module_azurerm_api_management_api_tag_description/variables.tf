variable "api_management_api_tag_descriptions" {
  description = <<EOT
Map of api_management_api_tag_descriptions, attributes below
Required:
    - api_tag_id
Optional:
    - description
    - external_documentation_description
    - external_documentation_url
EOT

  type = map(object({
    api_tag_id                         = string
    description                        = optional(string)
    external_documentation_description = optional(string)
    external_documentation_url         = optional(string)
  }))
}
