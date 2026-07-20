variable "access_package_assignment_policies" {
  description = <<EOT
Map of access_package_assignment_policies, attributes below
Required:
    - access_package_id
    - description
    - display_name
Optional:
    - duration_in_days
    - expiration_date
    - extension_enabled
    - approval_settings
    - assignment_review_settings
    - question
    - requestor_settings
EOT

  type = map(object({
    access_package_id          = string
    description                = string
    display_name               = string
    duration_in_days           = optional(number)
    expiration_date            = optional(string)
    extension_enabled          = optional(bool)
    approval_settings          = optional(list(object({
            approval_required                = optional(bool)
            approval_required_for_extension  = optional(bool)
            requestor_justification_required = optional(bool)
            approval_stage                   = optional(list(object({
                approval_timeout_in_days            = number
                alternative_approval_enabled        = optional(bool)
                approver_justification_required     = optional(bool)
                enable_alternative_approval_in_days = optional(number)
                alternative_approver                = optional(list(object({
                    subject_type = string
                    backup       = optional(bool)
                    object_id    = optional(string)
                })))
                primary_approver                    = optional(list(object({
                    subject_type = string
                    backup       = optional(bool)
                    object_id    = optional(string)
                })))
            })))
        })))
    assignment_review_settings = optional(list(object({
            access_recommendation_enabled   = optional(bool)
            access_review_timeout_behavior  = optional(string)
            approver_justification_required = optional(bool)
            duration_in_days                = optional(number)
            enabled                         = optional(bool)
            review_frequency                = optional(string)
            review_type                     = optional(string)
            starting_on                     = optional(string)
            reviewer                        = optional(list(object({
                subject_type = string
                backup       = optional(bool)
                object_id    = optional(string)
            })))
        })))
    question                   = optional(list(object({
            required = optional(bool)
            sequence = optional(number)
            choice   = optional(list(object({
                actual_value  = string
                display_value = list(object({
                    default_text   = string
                    localized_text = optional(list(object({
                        content       = string
                        language_code = string
                    })))
                }))
            })))
            text     = list(object({
                default_text   = string
                localized_text = optional(list(object({
                    content       = string
                    language_code = string
                })))
            }))
        })))
    requestor_settings         = optional(list(object({
            requests_accepted = optional(bool)
            scope_type        = optional(string)
            requestor         = optional(list(object({
                subject_type = string
                backup       = optional(bool)
                object_id    = optional(string)
            })))
        })))
  }))
}
