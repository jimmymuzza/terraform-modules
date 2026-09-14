variable "pinpoint_baidu_channels" {
  description = <<EOT
Map of pinpoint_baidu_channels, attributes below
Required:
    - api_key
    - application_id
    - secret_key
Optional:
    - enabled
    - region
EOT

  type = map(object({
    api_key        = string
    application_id = string
    secret_key     = string
    enabled        = optional(bool)
    region         = optional(string)
  }))
}
