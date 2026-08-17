variable "log_analytics_linked_storage_accounts" {
  description = <<EOT
Map of log_analytics_linked_storage_accounts, attributes below
Required:
    - data_source_type
    - resource_group_name
    - storage_account_ids
    - workspace_id
EOT

  type = map(object({
    data_source_type    = string
    resource_group_name = string
    storage_account_ids = set(string)
    workspace_id        = string
  }))
}
