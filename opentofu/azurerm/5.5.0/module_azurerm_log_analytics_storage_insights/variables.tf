variable "log_analytics_storage_insights" {
  description = <<EOT
Map of log_analytics_storage_insights, attributes below
Required:
    - name
    - resource_group_name
    - storage_account_id
    - storage_account_key
    - workspace_id
Optional:
    - blob_container_names
    - table_names
EOT

  type = map(object({
    name                 = string
    resource_group_name  = string
    storage_account_id   = string
    storage_account_key  = string
    workspace_id         = string
    blob_container_names = optional(set(string))
    table_names          = optional(set(string))
  }))
}
