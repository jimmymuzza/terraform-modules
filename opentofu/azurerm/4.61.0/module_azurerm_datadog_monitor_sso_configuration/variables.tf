variable "datadog_monitor_sso_configurations" {
  description = <<EOT
Map of datadog_monitor_sso_configurations, attributes below
Required:
    - datadog_monitor_id
    - enterprise_application_id
Optional:
    - name
    - single_sign_on
    - single_sign_on_enabled
EOT

  type = map(object({
    datadog_monitor_id        = string
    enterprise_application_id = string
    name                      = optional(string)
    single_sign_on            = optional(string)
    single_sign_on_enabled    = optional(string)
  }))
}
