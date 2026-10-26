variable "dataexchange_data_sets" {
  description = <<EOT
Map of dataexchange_data_sets, attributes below
Required:
    - asset_type
    - description
    - name
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    asset_type  = string
    description = string
    name        = string
    region      = optional(string)
    tags        = optional(map(string))
    tags_all    = optional(map(string))
  }))
}
