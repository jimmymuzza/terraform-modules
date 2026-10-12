variable "servicecatalogappregistry_attribute_groups" {
  description = <<EOT
Map of servicecatalogappregistry_attribute_groups, attributes below
Required:
    - attributes
    - name
Optional:
    - description
    - region
    - tags
EOT

  type = map(object({
    attributes  = string
    name        = string
    description = optional(string)
    region      = optional(string)
    tags        = optional(map(string))
  }))
}
