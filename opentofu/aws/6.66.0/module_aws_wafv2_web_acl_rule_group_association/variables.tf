variable "wafv2_web_acl_rule_group_associations" {
  description = <<EOT
Map of wafv2_web_acl_rule_group_associations, attributes below
Required:
    - priority
    - rule_name
    - web_acl_arn
Optional:
    - override_action
    - region
    - managed_rule_group
    - rule_group_reference
    - visibility_config
EOT

  type = map(object({
    priority             = number
    rule_name            = string
    web_acl_arn          = string
    override_action      = optional(string)
    region               = optional(string)
    managed_rule_group   = optional(list(object({
            name                       = string
            vendor_name                = string
            version                    = optional(string)
            managed_rule_group_configs = optional(list(object({
                aws_managed_rules_acfp_rule_set        = optional(list(object({
                    creation_path          = string
                    registration_page_path = string
                    enable_regex_in_path   = optional(bool)
                    request_inspection     = optional(list(object({
                        payload_type        = string
                        address_fields      = optional(list(object({
                            identifiers = list(string)
                        })))
                        email_field         = optional(list(object({
                            identifier = string
                        })))
                        password_field      = optional(list(object({
                            identifier = string
                        })))
                        phone_number_fields = optional(list(object({
                            identifiers = list(string)
                        })))
                        username_field      = optional(list(object({
                            identifier = string
                        })))
                    })))
                    response_inspection    = optional(list(object({
                        body_contains = optional(list(object({
                            failure_strings = set(string)
                            success_strings = set(string)
                        })))
                        header        = optional(list(object({
                            failure_values = set(string)
                            name           = string
                            success_values = set(string)
                        })))
                        json          = optional(list(object({
                            failure_values = set(string)
                            identifier     = string
                            success_values = set(string)
                        })))
                        status_code   = optional(list(object({
                            failure_codes = set(number)
                            success_codes = set(number)
                        })))
                    })))
                })))
                aws_managed_rules_anti_ddos_rule_set   = optional(list(object({
                    sensitivity_to_block      = optional(string)
                    client_side_action_config = optional(list(object({
                        challenge = optional(list(object({
                            usage_of_action               = string
                            sensitivity                   = optional(string)
                            exempt_uri_regular_expression = optional(list(object({
                                regex_string = optional(string)
                            })))
                        })))
                    })))
                })))
                aws_managed_rules_atp_rule_set         = optional(list(object({
                    login_path           = string
                    enable_regex_in_path = optional(bool)
                    request_inspection   = optional(list(object({
                        payload_type   = string
                        password_field = optional(list(object({
                            identifier = string
                        })))
                        username_field = optional(list(object({
                            identifier = string
                        })))
                    })))
                    response_inspection  = optional(list(object({
                        body_contains = optional(list(object({
                            failure_strings = set(string)
                            success_strings = set(string)
                        })))
                        header        = optional(list(object({
                            failure_values = set(string)
                            name           = string
                            success_values = set(string)
                        })))
                        json          = optional(list(object({
                            failure_values = set(string)
                            identifier     = string
                            success_values = set(string)
                        })))
                        status_code   = optional(list(object({
                            failure_codes = set(number)
                            success_codes = set(number)
                        })))
                    })))
                })))
                aws_managed_rules_bot_control_rule_set = optional(list(object({
                    inspection_level        = string
                    enable_machine_learning = optional(bool)
                })))
            })))
            rule_action_override       = optional(list(object({
                name          = string
                action_to_use = optional(list(object({
                    allow     = optional(list(object({
                        custom_request_handling = optional(list(object({
                            insert_header = optional(list(object({
                                name  = string
                                value = string
                            })))
                        })))
                    })))
                    block     = optional(list(object({
                        custom_response = optional(list(object({
                            response_code            = number
                            custom_response_body_key = optional(string)
                            response_header          = optional(list(object({
                                name  = string
                                value = string
                            })))
                        })))
                    })))
                    captcha   = optional(list(object({
                        custom_request_handling = optional(list(object({
                            insert_header = optional(list(object({
                                name  = string
                                value = string
                            })))
                        })))
                    })))
                    challenge = optional(list(object({
                        custom_request_handling = optional(list(object({
                            insert_header = optional(list(object({
                                name  = string
                                value = string
                            })))
                        })))
                    })))
                    count     = optional(list(object({
                        custom_request_handling = optional(list(object({
                            insert_header = optional(list(object({
                                name  = string
                                value = string
                            })))
                        })))
                    })))
                })))
            })))
        })))
    rule_group_reference = optional(list(object({
            arn                  = string
            rule_action_override = optional(list(object({
                name          = string
                action_to_use = optional(list(object({
                    allow     = optional(list(object({
                        custom_request_handling = optional(list(object({
                            insert_header = optional(list(object({
                                name  = string
                                value = string
                            })))
                        })))
                    })))
                    block     = optional(list(object({
                        custom_response = optional(list(object({
                            response_code            = number
                            custom_response_body_key = optional(string)
                            response_header          = optional(list(object({
                                name  = string
                                value = string
                            })))
                        })))
                    })))
                    captcha   = optional(list(object({
                        custom_request_handling = optional(list(object({
                            insert_header = optional(list(object({
                                name  = string
                                value = string
                            })))
                        })))
                    })))
                    challenge = optional(list(object({
                        custom_request_handling = optional(list(object({
                            insert_header = optional(list(object({
                                name  = string
                                value = string
                            })))
                        })))
                    })))
                    count     = optional(list(object({
                        custom_request_handling = optional(list(object({
                            insert_header = optional(list(object({
                                name  = string
                                value = string
                            })))
                        })))
                    })))
                })))
            })))
        })))
    visibility_config    = optional(list(object({
            cloudwatch_metrics_enabled = bool
            metric_name                = string
            sampled_requests_enabled   = bool
        })))
  }))
}
