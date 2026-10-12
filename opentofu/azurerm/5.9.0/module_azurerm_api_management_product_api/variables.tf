variable "api_management_product_apis" {
  description = <<EOT
Map of api_management_product_apis, attributes below
Required:
    - api_management_name
    - api_name
    - product_id
    - resource_group_name
EOT

  type = map(object({
    api_management_name = string
    api_name            = string
    product_id          = string
    resource_group_name = string
  }))
}
