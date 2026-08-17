variable "api_gateway_documentation_versions" {
  description = <<EOT
Map of api_gateway_documentation_versions, attributes below
Required:
    - rest_api_id
    - version
Optional:
    - description
    - region
EOT

  type = map(object({
    rest_api_id = string
    version     = string
    description = optional(string)
    region      = optional(string)
  }))
}
