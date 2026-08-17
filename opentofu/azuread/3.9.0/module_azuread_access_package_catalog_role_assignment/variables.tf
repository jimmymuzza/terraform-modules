variable "access_package_catalog_role_assignments" {
  description = <<EOT
Map of access_package_catalog_role_assignments, attributes below
Required:
    - catalog_id
    - principal_object_id
    - role_id
EOT

  type = map(object({
    catalog_id          = string
    principal_object_id = string
    role_id             = string
  }))
}
