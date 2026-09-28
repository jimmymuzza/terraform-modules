variable "wafv2_web_acl_logging_configurations" {
  description = <<EOT
Map of wafv2_web_acl_logging_configurations, attributes below
Required:
    - log_destination_configs
    - resource_arn
Optional:
    - region
    - logging_filter
    - redacted_fields
EOT

  type = map(object({
    log_destination_configs = set(string)
    resource_arn            = string
    region                  = optional(string)
    logging_filter          = optional(list(object({
            default_behavior = string
            filter           = set(object({
                behavior    = string
                requirement = string
                condition   = set(object({
                    action_condition     = optional(list(object({
                        action = string
                    })))
                    label_name_condition = optional(list(object({
                        label_name = string
                    })))
                }))
            }))
        })))
    redacted_fields         = optional(list(object({
            method        = optional(list(object({

            })))
            query_string  = optional(list(object({

            })))
            single_header = optional(list(object({
                name = string
            })))
            uri_path      = optional(list(object({

            })))
        })))
  }))
}
