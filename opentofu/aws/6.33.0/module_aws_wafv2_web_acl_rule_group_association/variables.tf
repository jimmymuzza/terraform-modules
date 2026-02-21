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
EOT

  type = map(object({
    priority             = number
    rule_name            = string
    web_acl_arn          = string
    override_action      = optional(string)
    region               = optional(string)
    managed_rule_group   = optional(list(object({
            name                 = string
            vendor_name          = string
            version              = optional(string)
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
  }))
}
