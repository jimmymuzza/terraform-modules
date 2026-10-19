variable "access_package_catalogs" {
  description = <<EOT
Map of access_package_catalogs, attributes below
Required:
    - description
    - display_name
Optional:
    - externally_visible
    - published
EOT

  type = map(object({
    description        = string
    display_name       = string
    externally_visible = optional(bool)
    published          = optional(bool)
  }))
}
