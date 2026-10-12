variable "lambda_function_event_invoke_configs" {
  description = <<EOT
Map of lambda_function_event_invoke_configs, attributes below
Required:
    - function_name
Optional:
    - maximum_event_age_in_seconds
    - maximum_retry_attempts
    - qualifier
    - region
    - destination_config
EOT

  type = map(object({
    function_name                = string
    maximum_event_age_in_seconds = optional(number)
    maximum_retry_attempts       = optional(number)
    qualifier                    = optional(string)
    region                       = optional(string)
    destination_config           = optional(list(object({
            on_failure = optional(list(object({
                destination = string
            })))
            on_success = optional(list(object({
                destination = string
            })))
        })))
  }))
}
