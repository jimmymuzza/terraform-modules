variable "group_role_management_policies" {
  description = <<EOT
Map of group_role_management_policies, attributes below
Required:
    - group_id
    - role_id
Optional:
    - activation_rules
    - active_assignment_rules
    - eligible_assignment_rules
    - notification_rules
EOT

  type = map(object({
    group_id                  = string
    role_id                   = string
    activation_rules          = optional(list(object({
            maximum_duration                                   = optional(string)
            require_approval                                   = optional(bool)
            require_justification                              = optional(bool)
            require_multifactor_authentication                 = optional(bool)
            require_ticket_info                                = optional(bool)
            required_conditional_access_authentication_context = optional(string)
            approval_stage                                     = optional(list(object({
                primary_approver = set(object({
                    object_id = string
                    type      = optional(string)
                }))
            })))
        })))
    active_assignment_rules   = optional(list(object({
            expiration_required                = optional(bool)
            expire_after                       = optional(string)
            require_justification              = optional(bool)
            require_multifactor_authentication = optional(bool)
            require_ticket_info                = optional(bool)
        })))
    eligible_assignment_rules = optional(list(object({
            expiration_required = optional(bool)
            expire_after        = optional(string)
        })))
    notification_rules        = optional(list(object({
            active_assignments   = optional(list(object({
                admin_notifications    = optional(list(object({
                    default_recipients    = bool
                    notification_level    = string
                    additional_recipients = optional(set(string))
                })))
                approver_notifications = optional(list(object({
                    default_recipients    = bool
                    notification_level    = string
                    additional_recipients = optional(set(string))
                })))
                assignee_notifications = optional(list(object({
                    default_recipients    = bool
                    notification_level    = string
                    additional_recipients = optional(set(string))
                })))
            })))
            eligible_activations = optional(list(object({
                admin_notifications    = optional(list(object({
                    default_recipients    = bool
                    notification_level    = string
                    additional_recipients = optional(set(string))
                })))
                approver_notifications = optional(list(object({
                    default_recipients    = bool
                    notification_level    = string
                    additional_recipients = optional(set(string))
                })))
                assignee_notifications = optional(list(object({
                    default_recipients    = bool
                    notification_level    = string
                    additional_recipients = optional(set(string))
                })))
            })))
            eligible_assignments = optional(list(object({
                admin_notifications    = optional(list(object({
                    default_recipients    = bool
                    notification_level    = string
                    additional_recipients = optional(set(string))
                })))
                approver_notifications = optional(list(object({
                    default_recipients    = bool
                    notification_level    = string
                    additional_recipients = optional(set(string))
                })))
                assignee_notifications = optional(list(object({
                    default_recipients    = bool
                    notification_level    = string
                    additional_recipients = optional(set(string))
                })))
            })))
        })))
  }))
}
