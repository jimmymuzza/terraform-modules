variable "datadog_monitor_sso_configurations" {
  description = <<EOT
Map of datadog_monitor_sso_configurations, attributes below
Required:
    - datadog_monitor_id
    - enterprise_application_id
    - single_sign_on
Optional:
    - name
EOT

  type = map(object({
    datadog_monitor_id        = string
    enterprise_application_id = string
    single_sign_on            = string
    name                      = optional(string)
  }))
}
