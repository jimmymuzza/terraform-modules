variable "pinpoint_sms_channels" {
  description = <<EOT
Map of pinpoint_sms_channels, attributes below
Required:
    - application_id
Optional:
    - enabled
    - region
    - sender_id
    - short_code
EOT

  type = map(object({
    application_id = string
    enabled        = optional(bool)
    region         = optional(string)
    sender_id      = optional(string)
    short_code     = optional(string)
  }))
}
