variable "storage_sync_cloud_endpoints" {
  description = <<EOT
Map of storage_sync_cloud_endpoints, attributes below
Required:
    - file_share_name
    - name
    - storage_account_id
    - storage_sync_group_id
Optional:
    - storage_account_tenant_id
EOT

  type = map(object({
    file_share_name           = string
    name                      = string
    storage_account_id        = string
    storage_sync_group_id     = string
    storage_account_tenant_id = optional(string)
  }))
}
