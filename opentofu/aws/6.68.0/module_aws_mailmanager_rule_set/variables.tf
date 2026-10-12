variable "mailmanager_rule_sets" {
  description = <<EOT
Map of mailmanager_rule_sets, attributes below
Required:
    - name
Optional:
    - region
    - tags
    - rule
EOT

  type = map(object({
    name   = string
    region = optional(string)
    tags   = optional(map(string))
    rule   = optional(list(object({
            name      = optional(string)
            action    = optional(list(object({
                add_header            = optional(list(object({
                    header_name  = string
                    header_value = string
                })))
                archive               = optional(list(object({
                    target_archive        = string
                    action_failure_policy = optional(string)
                })))
                bounce                = optional(list(object({
                    diagnostic_message    = string
                    role_arn              = string
                    sender                = string
                    smtp_reply_code       = string
                    status_code           = string
                    action_failure_policy = optional(string)
                    message               = optional(string)
                })))
                deliver_to_mailbox    = optional(list(object({
                    mailbox_arn           = string
                    role_arn              = string
                    action_failure_policy = optional(string)
                })))
                deliver_to_q_business = optional(list(object({
                    application_id        = string
                    index_id              = string
                    role_arn              = string
                    action_failure_policy = optional(string)
                })))
                drop                  = optional(list(object({

                })))
                invoke_lambda         = optional(list(object({
                    function_arn          = string
                    invocation_type       = string
                    role_arn              = string
                    action_failure_policy = optional(string)
                    retry_time_minutes    = optional(number)
                })))
                publish_to_sns        = optional(list(object({
                    role_arn              = string
                    topic_arn             = string
                    action_failure_policy = optional(string)
                    encoding              = optional(string)
                    payload_type          = optional(string)
                })))
                relay                 = optional(list(object({
                    relay                 = string
                    action_failure_policy = optional(string)
                    mail_from             = optional(string)
                })))
                replace_recipient     = optional(list(object({
                    replace_with = optional(list(string))
                })))
                send                  = optional(list(object({
                    role_arn              = string
                    action_failure_policy = optional(string)
                })))
                write_to_s3           = optional(list(object({
                    role_arn              = string
                    s3_bucket             = string
                    action_failure_policy = optional(string)
                    s3_prefix             = optional(string)
                    s3_sse_kms_key_id     = optional(string)
                })))
            })))
            condition = optional(list(object({
                boolean_expression = optional(list(object({
                    operator = string
                    evaluate = optional(list(object({
                        attribute          = optional(string)
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
                dmarc_expression   = optional(list(object({
                    operator = string
                    values   = list(string)
                })))
                ip_expression      = optional(list(object({
                    operator = string
                    values   = list(string)
                    evaluate = optional(list(object({
                        attribute = string
                    })))
                })))
                number_expression  = optional(list(object({
                    operator = string
                    value    = number
                    evaluate = optional(list(object({
                        attribute = string
                    })))
                })))
                string_expression  = optional(list(object({
                    operator = string
                    values   = list(string)
                    evaluate = optional(list(object({
                        attribute                    = optional(string)
                        client_certificate_attribute = optional(string)
                        mime_header_attribute        = optional(string)
                        analysis                     = optional(list(object({
                            analyzer     = string
                            result_field = string
                        })))
                    })))
                })))
                verdict_expression = optional(list(object({
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
            })))
            unless    = optional(list(object({
                boolean_expression = optional(list(object({
                    operator = string
                    evaluate = optional(list(object({
                        attribute          = optional(string)
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
                dmarc_expression   = optional(list(object({
                    operator = string
                    values   = list(string)
                })))
                ip_expression      = optional(list(object({
                    operator = string
                    values   = list(string)
                    evaluate = optional(list(object({
                        attribute = string
                    })))
                })))
                number_expression  = optional(list(object({
                    operator = string
                    value    = number
                    evaluate = optional(list(object({
                        attribute = string
                    })))
                })))
                string_expression  = optional(list(object({
                    operator = string
                    values   = list(string)
                    evaluate = optional(list(object({
                        attribute                    = optional(string)
                        client_certificate_attribute = optional(string)
                        mime_header_attribute        = optional(string)
                        analysis                     = optional(list(object({
                            analyzer     = string
                            result_field = string
                        })))
                    })))
                })))
                verdict_expression = optional(list(object({
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
            })))
        })))
  }))
}
