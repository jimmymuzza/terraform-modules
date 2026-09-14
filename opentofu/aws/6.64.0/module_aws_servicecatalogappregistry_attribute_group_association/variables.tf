variable "servicecatalogappregistry_attribute_group_associations" {
  description = <<EOT
Map of servicecatalogappregistry_attribute_group_associations, attributes below
Required:
    - application_id
    - attribute_group_id
Optional:
    - region
EOT

  type = map(object({
    application_id     = string
    attribute_group_id = string
    region             = optional(string)
  }))
}
