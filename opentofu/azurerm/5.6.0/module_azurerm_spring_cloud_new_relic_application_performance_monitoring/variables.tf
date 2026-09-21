variable "spring_cloud_new_relic_application_performance_monitorings" {
  description = <<EOT
Map of spring_cloud_new_relic_application_performance_monitorings, attributes below
Required:
    - app_name
    - license_key
    - name
    - spring_cloud_service_id
Optional:
    - agent_enabled
    - app_server_port
    - audit_mode_enabled
    - auto_app_naming_enabled
    - auto_transaction_naming_enabled
    - custom_tracing_enabled
    - globally_enabled
    - labels
EOT

  type = map(object({
    app_name                        = string
    license_key                     = string
    name                            = string
    spring_cloud_service_id         = string
    agent_enabled                   = optional(bool)
    app_server_port                 = optional(number)
    audit_mode_enabled              = optional(bool)
    auto_app_naming_enabled         = optional(bool)
    auto_transaction_naming_enabled = optional(bool)
    custom_tracing_enabled          = optional(bool)
    globally_enabled                = optional(bool)
    labels                          = optional(map(string))
  }))
}
