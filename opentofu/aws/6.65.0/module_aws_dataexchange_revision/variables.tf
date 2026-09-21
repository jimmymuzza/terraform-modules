variable "dataexchange_revisions" {
  description = <<EOT
Map of dataexchange_revisions, attributes below
Required:
    - data_set_id
Optional:
    - comment
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    data_set_id = string
    comment     = optional(string)
    region      = optional(string)
    tags        = optional(map(string))
    tags_all    = optional(map(string))
  }))
}
