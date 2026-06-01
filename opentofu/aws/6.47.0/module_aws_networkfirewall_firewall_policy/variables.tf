variable "networkfirewall_firewall_policies" {
  description = <<EOT
Map of networkfirewall_firewall_policies, attributes below
Required:
    - name
    - firewall_policy
Optional:
    - description
    - region
    - tags
    - tags_all
    - encryption_configuration
EOT

  type = map(object({
    name                     = string
    description              = optional(string)
    region                   = optional(string)
    tags                     = optional(map(string))
    tags_all                 = optional(map(string))
    encryption_configuration = optional(list(object({
            type   = string
            key_id = optional(string)
        })))
    firewall_policy          = list(object({
            stateless_default_actions          = set(string)
            stateless_fragment_default_actions = set(string)
            enable_tls_session_holding         = optional(bool)
            stateful_default_actions           = optional(set(string))
            tls_inspection_configuration_arn   = optional(string)
            policy_variables                   = optional(list(object({
                rule_variables = optional(set(object({
                    key    = string
                    ip_set = list(object({
                        definition = set(string)
                    }))
                })))
            })))
            stateful_engine_options            = optional(list(object({
                rule_order              = optional(string)
                stream_exception_policy = optional(string)
                flow_timeouts           = optional(list(object({
                    tcp_idle_timeout_seconds = optional(number)
                })))
            })))
            stateful_rule_group_reference      = optional(set(object({
                resource_arn           = string
                deep_threat_inspection = optional(string)
                priority               = optional(number)
                override               = optional(list(object({
                    action = optional(string)
                })))
            })))
            stateless_custom_action            = optional(set(object({
                action_name       = string
                action_definition = list(object({
                    publish_metric_action = list(object({
                        dimension = set(object({
                            value = string
                        }))
                    }))
                }))
            })))
            stateless_rule_group_reference     = optional(set(object({
                priority     = number
                resource_arn = string
            })))
        }))
  }))
}
