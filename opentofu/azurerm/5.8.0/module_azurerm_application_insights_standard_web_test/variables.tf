variable "application_insights_standard_web_tests" {
  description = <<EOT
Map of application_insights_standard_web_tests, attributes below
Required:
    - application_insights_id
    - geo_locations
    - location
    - name
    - resource_group_name
    - request
Optional:
    - description
    - enabled
    - frequency
    - retry_enabled
    - tags
    - timeout
    - validation_rules
EOT

  type = map(object({
    application_insights_id = string
    geo_locations           = list(string)
    location                = string
    name                    = string
    resource_group_name     = string
    description             = optional(string)
    enabled                 = optional(bool)
    frequency               = optional(number)
    retry_enabled           = optional(bool)
    tags                    = optional(map(string))
    timeout                 = optional(number)
    request                 = list(object({
            url                              = string
            body                             = optional(string)
            follow_redirects_enabled         = optional(bool)
            http_verb                        = optional(string)
            parse_dependent_requests_enabled = optional(bool)
            header                           = optional(list(object({
                name  = string
                value = string
            })))
        }))
    validation_rules        = optional(list(object({
            expected_status_code        = optional(number)
            ssl_cert_remaining_lifetime = optional(number)
            ssl_check_enabled           = optional(bool)
            content                     = optional(list(object({
                content_match      = string
                ignore_case        = optional(bool)
                pass_if_text_found = optional(bool)
            })))
        })))
  }))
}
