variable "apigatewayv2_api_mappings" {
  description = <<EOT
Map of apigatewayv2_api_mappings, attributes below
Required:
    - api_id
    - domain_name
    - stage
Optional:
    - api_mapping_key
    - region
EOT

  type = map(object({
    api_id          = string
    domain_name     = string
    stage           = string
    api_mapping_key = optional(string)
    region          = optional(string)
  }))
}
