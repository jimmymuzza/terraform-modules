variable "frontdoor_rules_engines" {
  description = <<EOT
Map of frontdoor_rules_engines, attributes below
Required:
    - frontdoor_name
    - name
    - resource_group_name
Optional:
    - enabled
    - rule
EOT

  type = map(object({
    frontdoor_name      = string
    name                = string
    resource_group_name = string
    enabled             = optional(bool)
    rule                = optional(list(object({
            name            = string
            priority        = number
            action          = optional(list(object({
                request_header  = optional(list(object({
                    header_action_type = optional(string)
                    header_name        = optional(string)
                    value              = optional(string)
                })))
                response_header = optional(list(object({
                    header_action_type = optional(string)
                    header_name        = optional(string)
                    value              = optional(string)
                })))
            })))
            match_condition = optional(list(object({
                operator         = string
                negate_condition = optional(bool)
                selector         = optional(string)
                transform        = optional(list(string))
                value            = optional(list(string))
                variable         = optional(string)
            })))
        })))
  }))
}
