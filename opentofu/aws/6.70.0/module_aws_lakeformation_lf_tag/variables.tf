variable "lakeformation_lf_tags" {
  description = <<EOT
Map of lakeformation_lf_tags, attributes below
Required:
    - key
    - values
Optional:
    - catalog_id
    - region
EOT

  type = map(object({
    key        = string
    values     = set(string)
    catalog_id = optional(string)
    region     = optional(string)
  }))
}
