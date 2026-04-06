variable "rbin_rules" {
  description = <<EOT
Map of rbin_rules, attributes below
Required:
    - resource_type
    - retention_period
Optional:
    - description
    - region
    - tags
    - tags_all
    - exclude_resource_tags
    - lock_configuration
    - resource_tags
EOT

  type = map(object({
    resource_type         = string
    description           = optional(string)
    region                = optional(string)
    tags                  = optional(map(string))
    tags_all              = optional(map(string))
    exclude_resource_tags = optional(set(object({
            resource_tag_key   = string
            resource_tag_value = optional(string)
        })))
    lock_configuration    = optional(list(object({
            unlock_delay = list(object({
                unlock_delay_unit  = string
                unlock_delay_value = number
            }))
        })))
    resource_tags         = optional(set(object({
            resource_tag_key   = string
            resource_tag_value = optional(string)
        })))
    retention_period      = list(object({
            retention_period_unit  = string
            retention_period_value = number
        }))
  }))
}
