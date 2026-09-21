variable "appfabric_app_authorizations" {
  description = <<EOT
Map of appfabric_app_authorizations, attributes below
Required:
    - app
    - app_bundle_arn
    - auth_type
Optional:
    - region
    - tags
    - credential
    - tenant
EOT

  type = map(object({
    app            = string
    app_bundle_arn = string
    auth_type      = string
    region         = optional(string)
    tags           = optional(map(string))
    credential     = optional(list(object({
            api_key_credential = optional(list(object({
                api_key = string
            })))
            oauth2_credential  = optional(list(object({
                client_id     = string
                client_secret = string
            })))
        })))
    tenant         = optional(list(object({
            tenant_display_name = string
            tenant_identifier   = string
        })))
  }))
}
