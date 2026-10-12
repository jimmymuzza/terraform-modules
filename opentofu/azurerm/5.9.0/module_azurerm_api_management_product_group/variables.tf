variable "api_management_product_groups" {
  description = <<EOT
Map of api_management_product_groups, attributes below
Required:
    - api_management_name
    - group_name
    - product_id
    - resource_group_name
EOT

  type = map(object({
    api_management_name = string
    group_name          = string
    product_id          = string
    resource_group_name = string
  }))
}
