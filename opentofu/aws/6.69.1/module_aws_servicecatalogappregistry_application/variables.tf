variable "servicecatalogappregistry_applications" {
  description = <<EOT
Map of servicecatalogappregistry_applications, attributes below
Required:
    - name
Optional:
    - description
    - region
    - tags
EOT

  type = map(object({
    name        = string
    description = optional(string)
    region      = optional(string)
    tags        = optional(map(string))
  }))
}
