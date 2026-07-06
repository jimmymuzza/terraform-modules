variable "lakeformation_lf_tag_expressions" {
  description = <<EOT
Map of lakeformation_lf_tag_expressions, attributes below
Required:
    - name
Optional:
    - catalog_id
    - description
    - region
    - expression
EOT

  type = map(object({
    name        = string
    catalog_id  = optional(string)
    description = optional(string)
    region      = optional(string)
    expression  = optional(set(object({
            tag_key    = string
            tag_values = set(string)
        })))
  }))
}
