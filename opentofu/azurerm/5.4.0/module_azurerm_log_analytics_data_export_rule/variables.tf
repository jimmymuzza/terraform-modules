variable "log_analytics_data_export_rules" {
  description = <<EOT
Map of log_analytics_data_export_rules, attributes below
Required:
    - destination_resource_id
    - name
    - resource_group_name
    - table_names
    - workspace_resource_id
Optional:
    - enabled
EOT

  type = map(object({
    destination_resource_id = string
    name                    = string
    resource_group_name     = string
    table_names             = set(string)
    workspace_resource_id   = string
    enabled                 = optional(bool)
  }))
}
