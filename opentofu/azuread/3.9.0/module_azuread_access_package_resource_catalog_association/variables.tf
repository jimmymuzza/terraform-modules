variable "access_package_resource_catalog_associations" {
  description = <<EOT
Map of access_package_resource_catalog_associations, attributes below
Required:
    - catalog_id
    - resource_origin_id
    - resource_origin_system
EOT

  type = map(object({
    catalog_id             = string
    resource_origin_id     = string
    resource_origin_system = string
  }))
}
