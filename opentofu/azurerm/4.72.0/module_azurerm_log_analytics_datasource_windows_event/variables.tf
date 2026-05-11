variable "log_analytics_datasource_windows_events" {
  description = <<EOT
Map of log_analytics_datasource_windows_events, attributes below
Required:
    - event_log_name
    - event_types
    - name
    - resource_group_name
    - workspace_name
EOT

  type = map(object({
    event_log_name      = string
    event_types         = set(string)
    name                = string
    resource_group_name = string
    workspace_name      = string
  }))
}
