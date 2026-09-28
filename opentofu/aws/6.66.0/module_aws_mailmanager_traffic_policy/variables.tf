variable "mailmanager_traffic_policies" {
  description = <<EOT
Map of mailmanager_traffic_policies, attributes below
Required:
    - default_action
    - name
Optional:
    - max_message_size_bytes
    - region
    - tags
    - policy_statement
EOT

  type = map(object({
    default_action         = string
    name                   = string
    max_message_size_bytes = optional(number)
    region                 = optional(string)
    tags                   = optional(map(string))
    policy_statement       = optional(list(object({
            action    = string
            condition = optional(list(object({
                boolean_expression = optional(list(object({
                    operator = string
                    evaluate = optional(list(object({
                        analysis           = optional(list(object({
                            analyzer     = string
                            result_field = string
                        })))
                        is_in_address_list = optional(list(object({
                            address_lists = list(string)
                            attribute     = string
                        })))
                    })))
                })))
                ip_expression      = optional(list(object({
                    operator = string
                    values   = list(string)
                    evaluate = optional(list(object({
                        attribute = string
                    })))
                })))
                ipv6_expression    = optional(list(object({
                    operator = string
                    values   = list(string)
                    evaluate = optional(list(object({
                        attribute = string
                    })))
                })))
                string_expression  = optional(list(object({
                    operator = string
                    values   = list(string)
                    evaluate = optional(list(object({
                        attribute = optional(string)
                        analysis  = optional(list(object({
                            analyzer     = string
                            result_field = string
                        })))
                    })))
                })))
                tls_expression     = optional(list(object({
                    operator = string
                    value    = string
                    evaluate = optional(list(object({
                        attribute = string
                    })))
                })))
            })))
        })))
  }))
}
