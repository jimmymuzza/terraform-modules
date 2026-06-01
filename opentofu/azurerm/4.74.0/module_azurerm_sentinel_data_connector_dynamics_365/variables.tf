variable "sentinel_data_connector_dynamics_365s" {
  description = <<EOT
Map of sentinel_data_connector_dynamics_365s, attributes below
Required:
    - log_analytics_workspace_id
    - name
Optional:
    - tenant_id
EOT

  type = map(object({
    log_analytics_workspace_id = string
    name                       = string
    tenant_id                  = optional(string)
  }))
}
