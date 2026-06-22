variable "networkfirewall_rule_groups" {
  description = <<EOT
Map of networkfirewall_rule_groups, attributes below
Required:
    - capacity
    - name
    - type
Optional:
    - description
    - region
    - rules
    - tags
    - tags_all
    - encryption_configuration
    - rule_group
EOT

  type = map(object({
    capacity                 = number
    name                     = string
    type                     = string
    description              = optional(string)
    region                   = optional(string)
    rules                    = optional(string)
    tags                     = optional(map(string))
    tags_all                 = optional(map(string))
    encryption_configuration = optional(list(object({
            type   = string
            key_id = optional(string)
        })))
    rule_group               = optional(list(object({
            reference_sets        = optional(list(object({
                ip_set_references = optional(set(object({
                    key              = string
                    ip_set_reference = list(object({
                        reference_arn = string
                    }))
                })))
            })))
            rule_variables        = optional(list(object({
                ip_sets   = optional(set(object({
                    key    = string
                    ip_set = list(object({
                        definition = set(string)
                    }))
                })))
                port_sets = optional(set(object({
                    key      = string
                    port_set = list(object({
                        definition = set(string)
                    }))
                })))
            })))
            rules_source          = list(object({
                rules_string                       = optional(string)
                rules_source_list                  = optional(list(object({
                    generated_rules_type = string
                    target_types         = set(string)
                    targets              = set(string)
                })))
                stateful_rule                      = optional(list(object({
                    action      = string
                    header      = list(object({
                        destination      = string
                        destination_port = string
                        direction        = string
                        protocol         = string
                        source           = string
                        source_port      = string
                    }))
                    rule_option = set(object({
                        keyword  = string
                        settings = optional(set(string))
                    }))
                })))
                stateless_rules_and_custom_actions = optional(list(object({
                    custom_action  = optional(set(object({
                        action_name       = string
                        action_definition = list(object({
                            publish_metric_action = list(object({
                                dimension = set(object({
                                    value = string
                                }))
                            }))
                        }))
                    })))
                    stateless_rule = set(object({
                        priority        = number
                        rule_definition = list(object({
                            actions          = set(string)
                            match_attributes = list(object({
                                protocols        = optional(set(number))
                                destination      = optional(set(object({
                                    address_definition = string
                                })))
                                destination_port = optional(set(object({
                                    from_port = number
                                    to_port   = optional(number)
                                })))
                                source           = optional(set(object({
                                    address_definition = string
                                })))
                                source_port      = optional(set(object({
                                    from_port = number
                                    to_port   = optional(number)
                                })))
                                tcp_flag         = optional(set(object({
                                    flags = set(string)
                                    masks = optional(set(string))
                                })))
                            }))
                        }))
                    }))
                })))
            }))
            stateful_rule_options = optional(list(object({
                rule_order = string
            })))
        })))
  }))
}
