variable "orbital_spacecrafts" {
  description = <<EOT
Map of orbital_spacecrafts, attributes below
Required:
    - location
    - name
    - norad_id
    - resource_group_name
    - title_line
    - two_line_elements
    - links
Optional:
    - tags
EOT

  type = map(object({
    location            = string
    name                = string
    norad_id            = string
    resource_group_name = string
    title_line          = string
    two_line_elements   = list(string)
    tags                = optional(map(string))
    links               = list(object({
            bandwidth_mhz        = number
            center_frequency_mhz = number
            direction            = string
            name                 = string
            polarization         = string
        }))
  }))
}
