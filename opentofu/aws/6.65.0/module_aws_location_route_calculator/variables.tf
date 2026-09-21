variable "location_route_calculators" {
  description = <<EOT
Map of location_route_calculators, attributes below
Required:
    - calculator_name
    - data_source
Optional:
    - description
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    calculator_name = string
    data_source     = string
    description     = optional(string)
    region          = optional(string)
    tags            = optional(map(string))
    tags_all        = optional(map(string))
  }))
}
