variable "cloudwatch_event_rules" {
  description = <<EOT
Map of cloudwatch_event_rules, attributes below
Optional:
    - description
    - event_bus_name
    - event_pattern
    - force_destroy
    - is_enabled
    - name
    - name_prefix
    - region
    - role_arn
    - schedule_expression
    - state
    - tags
    - tags_all
EOT

  type = map(object({
    description         = optional(string)
    event_bus_name      = optional(string)
    event_pattern       = optional(string)
    force_destroy       = optional(bool)
    is_enabled          = optional(bool)
    name                = optional(string)
    name_prefix         = optional(string)
    region              = optional(string)
    role_arn            = optional(string)
    schedule_expression = optional(string)
    state               = optional(string)
    tags                = optional(map(string))
    tags_all            = optional(map(string))
  }))
}
