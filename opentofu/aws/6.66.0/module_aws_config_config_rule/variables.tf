variable "config_config_rules" {
  description = <<EOT
Map of config_config_rules, attributes below
Required:
    - name
    - source
Optional:
    - description
    - input_parameters
    - maximum_execution_frequency
    - region
    - tags
    - tags_all
    - evaluation_mode
    - scope
EOT

  type = map(object({
    name                        = string
    description                 = optional(string)
    input_parameters            = optional(string)
    maximum_execution_frequency = optional(string)
    region                      = optional(string)
    tags                        = optional(map(string))
    tags_all                    = optional(map(string))
    evaluation_mode             = optional(set(object({
            mode = optional(string)
        })))
    scope                       = optional(list(object({
            compliance_resource_id    = optional(string)
            compliance_resource_types = optional(set(string))
            tag_key                   = optional(string)
            tag_value                 = optional(string)
        })))
    source                      = list(object({
            owner                 = string
            source_identifier     = optional(string)
            custom_policy_details = optional(list(object({
                policy_runtime            = string
                policy_text               = string
                enable_debug_log_delivery = optional(bool)
            })))
            source_detail         = optional(set(object({
                event_source                = optional(string)
                maximum_execution_frequency = optional(string)
                message_type                = optional(string)
            })))
        }))
  }))
}
