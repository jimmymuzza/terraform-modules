variable "cdn_frontdoor_firewall_policies" {
  description = <<EOT
Map of cdn_frontdoor_firewall_policies, attributes below
Required:
    - mode
    - name
    - resource_group_name
    - sku_name
Optional:
    - captcha_cookie_expiration_in_minutes
    - custom_block_response_body
    - custom_block_response_status_code
    - enabled
    - js_challenge_cookie_expiration_in_minutes
    - redirect_url
    - request_body_check_enabled
    - tags
    - custom_rule
    - log_scrubbing
    - managed_rule
EOT

  type = map(object({
    mode                                      = string
    name                                      = string
    resource_group_name                       = string
    sku_name                                  = string
    captcha_cookie_expiration_in_minutes      = optional(number)
    custom_block_response_body                = optional(string)
    custom_block_response_status_code         = optional(number)
    enabled                                   = optional(bool)
    js_challenge_cookie_expiration_in_minutes = optional(number)
    redirect_url                              = optional(string)
    request_body_check_enabled                = optional(bool)
    tags                                      = optional(map(string))
    custom_rule                               = optional(list(object({
            action                         = string
            name                           = string
            type                           = string
            enabled                        = optional(bool)
            priority                       = optional(number)
            rate_limit_duration_in_minutes = optional(number)
            rate_limit_threshold           = optional(number)
            match_condition                = optional(list(object({
                match_values       = list(string)
                match_variable     = string
                operator           = string
                negation_condition = optional(bool)
                selector           = optional(string)
                transforms         = optional(list(string))
            })))
        })))
    log_scrubbing                             = optional(list(object({
            enabled        = optional(bool)
            scrubbing_rule = list(object({
                match_variable = string
                enabled        = optional(bool)
                operator       = optional(string)
                selector       = optional(string)
            }))
        })))
    managed_rule                              = optional(list(object({
            action    = string
            type      = string
            version   = string
            exclusion = optional(list(object({
                match_variable = string
                operator       = string
                selector       = string
            })))
            override  = optional(list(object({
                rule_group_name = string
                exclusion       = optional(list(object({
                    match_variable = string
                    operator       = string
                    selector       = string
                })))
                rule            = optional(list(object({
                    action    = string
                    rule_id   = string
                    enabled   = optional(bool)
                    exclusion = optional(list(object({
                        match_variable = string
                        operator       = string
                        selector       = string
                    })))
                })))
            })))
        })))
  }))
}
