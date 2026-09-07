variable "named_locations" {
  description = <<EOT
Map of named_locations, attributes below
Required:
    - display_name
Optional:
    - country
    - ip
EOT

  type = map(object({
    display_name = string
    country      = optional(list(object({
            countries_and_regions                 = list(string)
            country_lookup_method                 = optional(string)
            include_unknown_countries_and_regions = optional(bool)
        })))
    ip           = optional(list(object({
            ip_ranges = list(string)
            trusted   = optional(bool)
        })))
  }))
}
