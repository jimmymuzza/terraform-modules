variable "sentinel_data_connector_threat_intelligence_taxiis" {
  description = <<EOT
Map of sentinel_data_connector_threat_intelligence_taxiis, attributes below
Required:
    - api_root_url
    - collection_id
    - display_name
    - log_analytics_workspace_id
    - name
Optional:
    - lookback_date
    - password
    - polling_frequency
    - tenant_id
    - user_name
EOT

  type = map(object({
    api_root_url               = string
    collection_id              = string
    display_name               = string
    log_analytics_workspace_id = string
    name                       = string
    lookback_date              = optional(string)
    password                   = optional(string)
    polling_frequency          = optional(string)
    tenant_id                  = optional(string)
    user_name                  = optional(string)
  }))
}
