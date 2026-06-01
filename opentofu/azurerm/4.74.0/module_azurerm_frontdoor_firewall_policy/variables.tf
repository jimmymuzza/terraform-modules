variable "frontdoor_firewall_policies" {
  description = <<EOT
Map of frontdoor_firewall_policies, attributes below
Required:
    - name
    - resource_group_name
Optional:
    - custom_block_response_body
    - custom_block_response_status_code
    - enabled
    - mode
    - redirect_url
    - tags
    - custom_rule
    - managed_rule
EOT

  type = map(object({
    name                              = string
    resource_group_name               = string
    custom_block_response_body        = optional(string)
    custom_block_response_status_code = optional(number)
    enabled                           = optional(bool)
    mode                              = optional(string)
    redirect_url                      = optional(string)
    tags                              = optional(map(string))
    custom_rule                       = optional(list(object({
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
    managed_rule                      = optional(list(object({
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
