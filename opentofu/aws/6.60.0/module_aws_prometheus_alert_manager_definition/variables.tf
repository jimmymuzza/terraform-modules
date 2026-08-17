variable "prometheus_alert_manager_definitions" {
  description = <<EOT
Map of prometheus_alert_manager_definitions, attributes below
Required:
    - definition
    - workspace_id
Optional:
    - region
EOT

  type = map(object({
    definition   = string
    workspace_id = string
    region       = optional(string)
  }))
}
