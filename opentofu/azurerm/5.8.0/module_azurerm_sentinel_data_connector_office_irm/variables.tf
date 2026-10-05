variable "sentinel_data_connector_office_irms" {
  description = <<EOT
Map of sentinel_data_connector_office_irms, attributes below
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
