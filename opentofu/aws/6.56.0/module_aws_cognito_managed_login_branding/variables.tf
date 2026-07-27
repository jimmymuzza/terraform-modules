variable "cognito_managed_login_brandings" {
  description = <<EOT
Map of cognito_managed_login_brandings, attributes below
Required:
    - client_id
    - user_pool_id
Optional:
    - region
    - settings
    - use_cognito_provided_values
    - asset
EOT

  type = map(object({
    client_id                   = string
    user_pool_id                = string
    region                      = optional(string)
    settings                    = optional(string)
    use_cognito_provided_values = optional(bool)
    asset                       = optional(set(object({
            category    = string
            color_mode  = string
            extension   = string
            bytes       = optional(string)
            resource_id = optional(string)
        })))
  }))
}
