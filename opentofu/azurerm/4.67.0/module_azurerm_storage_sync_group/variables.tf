variable "storage_sync_groups" {
  description = <<EOT
Map of storage_sync_groups, attributes below
Required:
    - name
    - storage_sync_id
EOT

  type = map(object({
    name            = string
    storage_sync_id = string
  }))
}
