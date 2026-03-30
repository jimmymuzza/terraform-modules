variable "pinpoint_apns_sandbox_channels" {
  description = <<EOT
Map of pinpoint_apns_sandbox_channels, attributes below
Required:
    - application_id
Optional:
    - bundle_id
    - certificate
    - default_authentication_method
    - enabled
    - private_key
    - region
    - team_id
    - token_key
    - token_key_id
EOT

  type = map(object({
    application_id                = string
    bundle_id                     = optional(string)
    certificate                   = optional(string)
    default_authentication_method = optional(string)
    enabled                       = optional(bool)
    private_key                   = optional(string)
    region                        = optional(string)
    team_id                       = optional(string)
    token_key                     = optional(string)
    token_key_id                  = optional(string)
  }))
}
