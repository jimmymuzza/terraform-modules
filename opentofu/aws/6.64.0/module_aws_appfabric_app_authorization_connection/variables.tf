variable "appfabric_app_authorization_connections" {
  description = <<EOT
Map of appfabric_app_authorization_connections, attributes below
Required:
    - app_authorization_arn
    - app_bundle_arn
Optional:
    - region
    - auth_request
EOT

  type = map(object({
    app_authorization_arn = string
    app_bundle_arn        = string
    region                = optional(string)
    auth_request          = optional(list(object({
            code         = string
            redirect_uri = string
        })))
  }))
}
