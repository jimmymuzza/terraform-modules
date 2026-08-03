variable "securityhub_automation_rules" {
  description = <<EOT
Map of securityhub_automation_rules, attributes below
Required:
    - description
    - rule_name
    - rule_order
Optional:
    - is_terminal
    - region
    - rule_status
    - tags
    - actions
    - criteria
EOT

  type = map(object({
    description = string
    rule_name   = string
    rule_order  = number
    is_terminal = optional(bool)
    region      = optional(string)
    rule_status = optional(string)
    tags        = optional(map(string))
    actions     = optional(set(object({
            type                  = optional(string)
            finding_fields_update = optional(list(object({
                confidence          = optional(number)
                criticality         = optional(number)
                types               = optional(list(string))
                user_defined_fields = optional(map(string))
                verification_state  = optional(string)
                note                = optional(list(object({
                    text       = string
                    updated_by = string
                })))
                related_findings    = optional(set(object({
                    product_arn = string
                })))
                severity            = optional(list(object({
                    label   = optional(string)
                    product = optional(number)
                })))
                workflow            = optional(list(object({
                    status = optional(string)
                })))
            })))
        })))
    criteria    = optional(list(object({
            aws_account_id                     = optional(set(object({
                comparison = string
                value      = string
            })))
            aws_account_name                   = optional(set(object({
                comparison = string
                value      = string
            })))
            company_name                       = optional(set(object({
                comparison = string
                value      = string
            })))
            compliance_associated_standards_id = optional(set(object({
                comparison = string
                value      = string
            })))
            compliance_security_control_id     = optional(set(object({
                comparison = string
                value      = string
            })))
            compliance_status                  = optional(set(object({
                comparison = string
                value      = string
            })))
            confidence                         = optional(set(object({
                eq  = optional(number)
                gt  = optional(number)
                gte = optional(number)
                lt  = optional(number)
                lte = optional(number)
            })))
            created_at                         = optional(set(object({
                end        = optional(string)
                start      = optional(string)
                date_range = optional(list(object({
                    unit  = string
                    value = number
                })))
            })))
            criticality                        = optional(set(object({
                eq  = optional(number)
                gt  = optional(number)
                gte = optional(number)
                lt  = optional(number)
                lte = optional(number)
            })))
            description                        = optional(set(object({
                comparison = string
                value      = string
            })))
            first_observed_at                  = optional(set(object({
                end        = optional(string)
                start      = optional(string)
                date_range = optional(list(object({
                    unit  = string
                    value = number
                })))
            })))
            generator_id                       = optional(set(object({
                comparison = string
                value      = string
            })))
            id                                 = optional(set(object({
                comparison = string
                value      = string
            })))
            last_observed_at                   = optional(set(object({
                end        = optional(string)
                start      = optional(string)
                date_range = optional(list(object({
                    unit  = string
                    value = number
                })))
            })))
            note_text                          = optional(set(object({
                comparison = string
                value      = string
            })))
            note_updated_at                    = optional(set(object({
                end        = optional(string)
                start      = optional(string)
                date_range = optional(list(object({
                    unit  = string
                    value = number
                })))
            })))
            note_updated_by                    = optional(set(object({
                comparison = string
                value      = string
            })))
            product_arn                        = optional(set(object({
                comparison = string
                value      = string
            })))
            product_name                       = optional(set(object({
                comparison = string
                value      = string
            })))
            record_state                       = optional(set(object({
                comparison = string
                value      = string
            })))
            related_findings_id                = optional(set(object({
                comparison = string
                value      = string
            })))
            related_findings_product_arn       = optional(set(object({
                comparison = string
                value      = string
            })))
            resource_application_arn           = optional(set(object({
                comparison = string
                value      = string
            })))
            resource_application_name          = optional(set(object({
                comparison = string
                value      = string
            })))
            resource_details_other             = optional(set(object({
                comparison = string
                key        = string
                value      = string
            })))
            resource_id                        = optional(set(object({
                comparison = string
                value      = string
            })))
            resource_partition                 = optional(set(object({
                comparison = string
                value      = string
            })))
            resource_region                    = optional(set(object({
                comparison = string
                value      = string
            })))
            resource_tags                      = optional(set(object({
                comparison = string
                key        = string
                value      = string
            })))
            resource_type                      = optional(set(object({
                comparison = string
                value      = string
            })))
            severity_label                     = optional(set(object({
                comparison = string
                value      = string
            })))
            source_url                         = optional(set(object({
                comparison = string
                value      = string
            })))
            title                              = optional(set(object({
                comparison = string
                value      = string
            })))
            type                               = optional(set(object({
                comparison = string
                value      = string
            })))
            updated_at                         = optional(set(object({
                end        = optional(string)
                start      = optional(string)
                date_range = optional(list(object({
                    unit  = string
                    value = number
                })))
            })))
            user_defined_fields                = optional(set(object({
                comparison = string
                key        = string
                value      = string
            })))
            verification_state                 = optional(set(object({
                comparison = string
                value      = string
            })))
            workflow_status                    = optional(set(object({
                comparison = string
                value      = string
            })))
        })))
  }))
}
