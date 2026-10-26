variable "pinpoint_gcm_channels" {
  description = <<EOT
Map of pinpoint_gcm_channels, attributes below
Required:
    - application_id
Optional:
    - api_key
    - default_authentication_method
    - enabled
    - region
    - service_json
EOT

  type = map(object({
    application_id                = string
    api_key                       = optional(string)
    default_authentication_method = optional(string)
    enabled                       = optional(bool)
    region                        = optional(string)
    service_json                  = optional(string)
  }))
}
