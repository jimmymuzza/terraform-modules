variable "location_place_indexes" {
  description = <<EOT
Map of location_place_indexes, attributes below
Required:
    - data_source
    - index_name
Optional:
    - description
    - region
    - tags
    - tags_all
    - data_source_configuration
EOT

  type = map(object({
    data_source               = string
    index_name                = string
    description               = optional(string)
    region                    = optional(string)
    tags                      = optional(map(string))
    tags_all                  = optional(map(string))
    data_source_configuration = optional(list(object({
            intended_use = optional(string)
        })))
  }))
}
