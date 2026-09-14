variable "log_analytics_datasource_windows_performance_counters" {
  description = <<EOT
Map of log_analytics_datasource_windows_performance_counters, attributes below
Required:
    - counter_name
    - instance_name
    - interval_seconds
    - name
    - object_name
    - resource_group_name
    - workspace_name
EOT

  type = map(object({
    counter_name        = string
    instance_name       = string
    interval_seconds    = number
    name                = string
    object_name         = string
    resource_group_name = string
    workspace_name      = string
  }))
}
