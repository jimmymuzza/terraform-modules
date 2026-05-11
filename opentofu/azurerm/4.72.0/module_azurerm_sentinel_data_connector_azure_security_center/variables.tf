variable "sentinel_data_connector_azure_security_centers" {
  description = <<EOT
Map of sentinel_data_connector_azure_security_centers, attributes below
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
