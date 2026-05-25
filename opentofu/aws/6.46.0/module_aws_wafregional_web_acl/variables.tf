variable "wafregional_web_acls" {
  description = <<EOT
Map of wafregional_web_acls, attributes below
Required:
    - metric_name
    - name
    - default_action
Optional:
    - region
    - tags
    - tags_all
    - logging_configuration
    - rule
EOT

  type = map(object({
    metric_name           = string
    name                  = string
    region                = optional(string)
    tags                  = optional(map(string))
    tags_all              = optional(map(string))
    default_action        = list(object({
            type = string
        }))
    logging_configuration = optional(list(object({
            log_destination = string
            redacted_fields = optional(list(object({
                field_to_match = set(object({
                    type = string
                    data = optional(string)
                }))
            })))
        })))
    rule                  = optional(set(object({
            priority        = number
            rule_id         = string
            type            = optional(string)
            action          = optional(list(object({
                type = string
            })))
            override_action = optional(list(object({
                type = string
            })))
        })))
  }))
}
