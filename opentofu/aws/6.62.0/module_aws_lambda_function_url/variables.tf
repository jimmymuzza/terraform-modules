variable "lambda_function_urls" {
  description = <<EOT
Map of lambda_function_urls, attributes below
Required:
    - authorization_type
    - function_name
Optional:
    - invoke_mode
    - qualifier
    - region
    - cors
EOT

  type = map(object({
    authorization_type = string
    function_name      = string
    invoke_mode        = optional(string)
    qualifier          = optional(string)
    region             = optional(string)
    cors               = optional(list(object({
            allow_credentials = optional(bool)
            allow_headers     = optional(set(string))
            allow_methods     = optional(set(string))
            allow_origins     = optional(set(string))
            expose_headers    = optional(set(string))
            max_age           = optional(number)
        })))
  }))
}
