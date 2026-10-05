variable "ssm_service_settings" {
  description = <<EOT
Map of ssm_service_settings, attributes below
Required:
    - setting_id
    - setting_value
Optional:
    - region
EOT

  type = map(object({
    setting_id    = string
    setting_value = string
    region        = optional(string)
  }))
}
