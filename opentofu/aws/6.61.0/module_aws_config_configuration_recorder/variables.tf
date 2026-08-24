variable "config_configuration_recorders" {
  description = <<EOT
Map of config_configuration_recorders, attributes below
Required:
    - role_arn
Optional:
    - name
    - region
    - recording_group
    - recording_mode
EOT

  type = map(object({
    role_arn        = string
    name            = optional(string)
    region          = optional(string)
    recording_group = optional(list(object({
            all_supported                 = optional(bool)
            include_global_resource_types = optional(bool)
            resource_types                = optional(set(string))
            exclusion_by_resource_types   = optional(list(object({
                resource_types = optional(set(string))
            })))
            recording_strategy            = optional(list(object({
                use_only = optional(string)
            })))
        })))
    recording_mode  = optional(list(object({
            recording_frequency     = optional(string)
            recording_mode_override = optional(list(object({
                recording_frequency = string
                resource_types      = set(string)
                description         = optional(string)
            })))
        })))
  }))
}
