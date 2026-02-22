variable "conditional_access_policies" {
  description = <<EOT
Map of conditional_access_policies, attributes below
Required:
    - display_name
    - state
    - conditions
Optional:
    - grant_controls
    - session_controls
EOT

  type = map(object({
    display_name     = string
    state            = string
    conditions       = list(object({
            client_app_types                     = list(string)
            authentication_flow_transfer_methods = optional(set(string))
            insider_risk_levels                  = optional(string)
            service_principal_risk_levels        = optional(list(string))
            sign_in_risk_levels                  = optional(list(string))
            user_risk_levels                     = optional(list(string))
            applications                         = list(object({
                excluded_applications = optional(list(string))
                included_applications = optional(list(string))
                included_user_actions = optional(list(string))
            }))
            client_applications                  = optional(list(object({
                excluded_service_principals = optional(list(string))
                included_service_principals = optional(list(string))
                filter                      = optional(list(object({
                    mode = string
                    rule = string
                })))
            })))
            devices                              = optional(list(object({
                filter = optional(list(object({
                    mode = string
                    rule = string
                })))
            })))
            locations                            = optional(list(object({
                included_locations = list(string)
                excluded_locations = optional(list(string))
            })))
            platforms                            = optional(list(object({
                included_platforms = list(string)
                excluded_platforms = optional(list(string))
            })))
            users                                = list(object({
                excluded_groups                   = optional(list(string))
                excluded_roles                    = optional(list(string))
                excluded_users                    = optional(list(string))
                included_groups                   = optional(list(string))
                included_roles                    = optional(list(string))
                included_users                    = optional(list(string))
                excluded_guests_or_external_users = optional(list(object({
                    guest_or_external_user_types = list(string)
                    external_tenants             = optional(list(object({
                        membership_kind = string
                        members         = optional(list(string))
                    })))
                })))
                included_guests_or_external_users = optional(list(object({
                    guest_or_external_user_types = list(string)
                    external_tenants             = optional(list(object({
                        membership_kind = string
                        members         = optional(list(string))
                    })))
                })))
            }))
        }))
    grant_controls   = optional(list(object({
            operator                          = string
            authentication_strength_policy_id = optional(string)
            built_in_controls                 = optional(list(string))
            custom_authentication_factors     = optional(list(string))
            terms_of_use                      = optional(list(string))
        })))
    session_controls = optional(list(object({
            application_enforced_restrictions_enabled = optional(bool)
            cloud_app_security_policy                 = optional(string)
            disable_resilience_defaults               = optional(bool)
            persistent_browser_mode                   = optional(string)
            sign_in_frequency                         = optional(number)
            sign_in_frequency_authentication_type     = optional(string)
            sign_in_frequency_interval                = optional(string)
            sign_in_frequency_period                  = optional(string)
        })))
  }))
}
