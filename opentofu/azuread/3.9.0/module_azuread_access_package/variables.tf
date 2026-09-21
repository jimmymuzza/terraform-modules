variable "access_packages" {
  description = <<EOT
Map of access_packages, attributes below
Required:
    - catalog_id
    - description
    - display_name
Optional:
    - hidden
EOT

  type = map(object({
    catalog_id   = string
    description  = string
    display_name = string
    hidden       = optional(bool)
  }))
}
