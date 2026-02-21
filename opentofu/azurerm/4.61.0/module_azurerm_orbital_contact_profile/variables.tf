variable "orbital_contact_profiles" {
  description = <<EOT
Map of orbital_contact_profiles, attributes below
Required:
    - auto_tracking
    - location
    - minimum_variable_contact_duration
    - name
    - network_configuration_subnet_id
    - resource_group_name
    - links
Optional:
    - event_hub_uri
    - minimum_elevation_degrees
    - tags
EOT

  type = map(object({
    auto_tracking                     = string
    location                          = string
    minimum_variable_contact_duration = string
    name                              = string
    network_configuration_subnet_id   = string
    resource_group_name               = string
    event_hub_uri                     = optional(string)
    minimum_elevation_degrees         = optional(number)
    tags                              = optional(map(string))
    links                             = list(object({
            direction    = string
            name         = string
            polarization = string
            channels     = list(object({
                bandwidth_mhz              = number
                center_frequency_mhz       = number
                name                       = string
                demodulation_configuration = optional(string)
                modulation_configuration   = optional(string)
                end_point                  = set(object({
                    end_point_name = string
                    port           = string
                    protocol       = string
                    ip_address     = optional(string)
                }))
            }))
        }))
  }))
}
