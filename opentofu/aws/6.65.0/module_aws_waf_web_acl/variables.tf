variable "waf_web_acls" {
  description = <<EOT
Map of waf_web_acls, attributes below
Required:
    - metric_name
    - name
    - default_action
Optional:
    - tags
    - tags_all
    - logging_configuration
    - rules
EOT

  type = map(object({
    metric_name           = string
    name                  = string
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
    rules                 = optional(set(object({
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
