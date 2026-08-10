variable "sentinel_data_connector_iots" {
  description = <<EOT
Map of sentinel_data_connector_iots, attributes below
Required:
    - log_analytics_workspace_id
    - name
Optional:
    - subscription_id
EOT

  type = map(object({
    log_analytics_workspace_id = string
    name                       = string
    subscription_id            = optional(string)
  }))
}
