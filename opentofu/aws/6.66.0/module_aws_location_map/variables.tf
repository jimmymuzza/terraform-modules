variable "location_maps" {
  description = <<EOT
Map of location_maps, attributes below
Required:
    - map_name
    - configuration
Optional:
    - description
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    map_name      = string
    description   = optional(string)
    region        = optional(string)
    tags          = optional(map(string))
    tags_all      = optional(map(string))
    configuration = list(object({
            style = string
        }))
  }))
}
