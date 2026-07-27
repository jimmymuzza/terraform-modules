variable "application_insights_web_tests" {
  description = <<EOT
Map of application_insights_web_tests, attributes below
Required:
    - application_insights_id
    - configuration
    - geo_locations
    - kind
    - location
    - name
    - resource_group_name
Optional:
    - description
    - enabled
    - frequency
    - retry_enabled
    - tags
    - timeout
EOT

  type = map(object({
    application_insights_id = string
    configuration           = string
    geo_locations           = list(string)
    kind                    = string
    location                = string
    name                    = string
    resource_group_name     = string
    description             = optional(string)
    enabled                 = optional(bool)
    frequency               = optional(number)
    retry_enabled           = optional(bool)
    tags                    = optional(map(string))
    timeout                 = optional(number)
  }))
}
