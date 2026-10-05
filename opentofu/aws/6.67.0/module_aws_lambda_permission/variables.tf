variable "lambda_permissions" {
  description = <<EOT
Map of lambda_permissions, attributes below
Required:
    - action
    - function_name
    - principal
Optional:
    - event_source_token
    - function_url_auth_type
    - invoked_via_function_url
    - principal_org_id
    - qualifier
    - region
    - source_account
    - source_arn
    - statement_id
    - statement_id_prefix
EOT

  type = map(object({
    action                   = string
    function_name            = string
    principal                = string
    event_source_token       = optional(string)
    function_url_auth_type   = optional(string)
    invoked_via_function_url = optional(bool)
    principal_org_id         = optional(string)
    qualifier                = optional(string)
    region                   = optional(string)
    source_account           = optional(string)
    source_arn               = optional(string)
    statement_id             = optional(string)
    statement_id_prefix      = optional(string)
  }))
}
