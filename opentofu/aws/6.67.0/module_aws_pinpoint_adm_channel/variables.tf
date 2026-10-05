variable "pinpoint_adm_channels" {
  description = <<EOT
Map of pinpoint_adm_channels, attributes below
Required:
    - application_id
    - client_id
    - client_secret
Optional:
    - enabled
    - region
EOT

  type = map(object({
    application_id = string
    client_id      = string
    client_secret  = string
    enabled        = optional(bool)
    region         = optional(string)
  }))
}
