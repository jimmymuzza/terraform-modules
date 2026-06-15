variable "sentinel_data_connector_microsoft_threat_intelligences" {
  description = <<EOT
Map of sentinel_data_connector_microsoft_threat_intelligences, attributes below
Required:
    - log_analytics_workspace_id
    - microsoft_emerging_threat_feed_lookback_date
    - name
Optional:
    - tenant_id
EOT

  type = map(object({
    log_analytics_workspace_id                   = string
    microsoft_emerging_threat_feed_lookback_date = string
    name                                         = string
    tenant_id                                    = optional(string)
  }))
}
