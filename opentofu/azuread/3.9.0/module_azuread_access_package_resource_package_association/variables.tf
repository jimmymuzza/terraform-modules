variable "access_package_resource_package_associations" {
  description = <<EOT
Map of access_package_resource_package_associations, attributes below
Required:
    - access_package_id
    - catalog_resource_association_id
Optional:
    - access_type
EOT

  type = map(object({
    access_package_id               = string
    catalog_resource_association_id = string
    access_type                     = optional(string)
  }))
}
