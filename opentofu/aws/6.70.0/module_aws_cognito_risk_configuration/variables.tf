variable "cognito_risk_configurations" {
  description = <<EOT
Map of cognito_risk_configurations, attributes below
Required:
    - user_pool_id
Optional:
    - client_id
    - region
    - account_takeover_risk_configuration
    - compromised_credentials_risk_configuration
    - risk_exception_configuration
EOT

  type = map(object({
    user_pool_id                               = string
    client_id                                  = optional(string)
    region                                     = optional(string)
    account_takeover_risk_configuration        = optional(list(object({
            actions              = list(object({
                high_action   = optional(list(object({
                    event_action = string
                    notify       = bool
                })))
                low_action    = optional(list(object({
                    event_action = string
                    notify       = bool
                })))
                medium_action = optional(list(object({
                    event_action = string
                    notify       = bool
                })))
            }))
            notify_configuration = optional(list(object({
                source_arn      = string
                from            = optional(string)
                reply_to        = optional(string)
                block_email     = optional(list(object({
                    html_body = string
                    subject   = string
                    text_body = string
                })))
                mfa_email       = optional(list(object({
                    html_body = string
                    subject   = string
                    text_body = string
                })))
                no_action_email = optional(list(object({
                    html_body = string
                    subject   = string
                    text_body = string
                })))
            })))
        })))
    compromised_credentials_risk_configuration = optional(list(object({
            event_filter = optional(set(string))
            actions      = list(object({
                event_action = string
            }))
        })))
    risk_exception_configuration               = optional(list(object({
            blocked_ip_range_list = optional(set(string))
            skipped_ip_range_list = optional(set(string))
        })))
  }))
}
