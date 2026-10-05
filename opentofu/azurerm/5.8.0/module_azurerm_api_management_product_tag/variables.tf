variable "api_management_product_tags" {
  description = <<EOT
Map of api_management_product_tags, attributes below
Required:
    - api_management_name
    - api_management_product_id
    - name
    - resource_group_name
EOT

  type = map(object({
    api_management_name       = string
    api_management_product_id = string
    name                      = string
    resource_group_name       = string
  }))
}
