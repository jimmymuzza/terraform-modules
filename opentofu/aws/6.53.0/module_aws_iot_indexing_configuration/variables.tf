variable "iot_indexing_configurations" {
  description = <<EOT
Map of iot_indexing_configurations, attributes below
Optional:
    - region
    - thing_group_indexing_configuration
    - thing_indexing_configuration
EOT

  type = map(object({
    region                             = optional(string)
    thing_group_indexing_configuration = optional(list(object({
            thing_group_indexing_mode = string
            custom_field              = optional(set(object({
                name = optional(string)
                type = optional(string)
            })))
            managed_field             = optional(set(object({
                name = optional(string)
                type = optional(string)
            })))
        })))
    thing_indexing_configuration       = optional(list(object({
            thing_indexing_mode              = string
            device_defender_indexing_mode    = optional(string)
            named_shadow_indexing_mode       = optional(string)
            thing_connectivity_indexing_mode = optional(string)
            custom_field                     = optional(set(object({
                name = optional(string)
                type = optional(string)
            })))
            filter                           = optional(list(object({
                named_shadow_names = optional(set(string))
            })))
            managed_field                    = optional(set(object({
                name = optional(string)
                type = optional(string)
            })))
        })))
  }))
}
