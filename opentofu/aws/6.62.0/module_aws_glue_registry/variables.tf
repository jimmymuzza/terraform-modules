variable "glue_registries" {
  description = <<EOT
Map of glue_registries, attributes below
Required:
    - registry_name
Optional:
    - description
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    registry_name = string
    description   = optional(string)
    region        = optional(string)
    tags          = optional(map(string))
    tags_all      = optional(map(string))
  }))
}
