variable "web_application_firewall_policies" {
  description = <<EOT
Map of web_application_firewall_policies, attributes below
Required:
    - location
    - name
    - resource_group_name
    - managed_rules
Optional:
    - tags
    - custom_rules
    - policy_settings
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    tags                = optional(map(string))
    custom_rules        = optional(list(object({
            action               = string
            priority             = number
            rule_type            = string
            enabled              = optional(bool)
            group_rate_limit_by  = optional(string)
            name                 = optional(string)
            rate_limit_duration  = optional(string)
            rate_limit_threshold = optional(number)
            match_conditions     = list(object({
                operator           = string
                match_values       = optional(list(string))
                negation_condition = optional(bool)
                transforms         = optional(set(string))
                match_variables    = list(object({
                    variable_name = string
                    selector      = optional(string)
                }))
            }))
        })))
    managed_rules       = list(object({
            exclusion        = optional(list(object({
                match_variable          = string
                selector                = string
                selector_match_operator = string
                excluded_rule_set       = optional(list(object({
                    type       = optional(string)
                    version    = optional(string)
                    rule_group = optional(list(object({
                        rule_group_name = string
                        excluded_rules  = optional(list(string))
                    })))
                })))
            })))
            managed_rule_set = list(object({
                version             = string
                type                = optional(string)
                rule_group_override = optional(list(object({
                    rule_group_name = string
                    rule            = optional(list(object({
                        action  = optional(string)
                        enabled = optional(bool)
                    })))
                })))
            }))
        }))
    policy_settings     = optional(list(object({
            enabled                                   = optional(bool)
            file_upload_enforcement                   = optional(bool)
            file_upload_limit_in_mb                   = optional(number)
            js_challenge_cookie_expiration_in_minutes = optional(number)
            max_request_body_size_in_kb               = optional(number)
            mode                                      = optional(string)
            request_body_check                        = optional(bool)
            request_body_enforcement                  = optional(bool)
            request_body_inspect_limit_in_kb          = optional(number)
            log_scrubbing                             = optional(list(object({
                enabled = optional(bool)
                rule    = optional(list(object({
                    match_variable          = string
                    enabled                 = optional(bool)
                    selector                = optional(string)
                    selector_match_operator = optional(string)
                })))
            })))
        })))
  }))
}
