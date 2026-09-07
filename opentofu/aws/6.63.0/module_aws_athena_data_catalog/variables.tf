variable "athena_data_catalogs" {
  description = <<EOT
Map of athena_data_catalogs, attributes below
Required:
    - description
    - name
    - parameters
    - type
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    description = string
    name        = string
    parameters  = map(string)
    type        = string
    region      = optional(string)
    tags        = optional(map(string))
    tags_all    = optional(map(string))
  }))
}
