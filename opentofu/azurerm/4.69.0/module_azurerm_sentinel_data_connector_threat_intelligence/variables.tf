variable "sentinel_data_connector_threat_intelligences" {
  description = <<EOT
Map of sentinel_data_connector_threat_intelligences, attributes below
Required:
    - log_analytics_workspace_id
    - name
Optional:
    - lookback_date
    - tenant_id
EOT

  type = map(object({
    log_analytics_workspace_id = string
    name                       = string
    lookback_date              = optional(string)
    tenant_id                  = optional(string)
  }))
}
