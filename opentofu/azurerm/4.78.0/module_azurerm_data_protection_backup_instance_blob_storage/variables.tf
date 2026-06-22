variable "data_protection_backup_instance_blob_storages" {
  description = <<EOT
Map of data_protection_backup_instance_blob_storages, attributes below
Required:
    - backup_policy_id
    - location
    - name
    - storage_account_id
    - vault_id
Optional:
    - storage_account_container_names
EOT

  type = map(object({
    backup_policy_id                = string
    location                        = string
    name                            = string
    storage_account_id              = string
    vault_id                        = string
    storage_account_container_names = optional(list(string))
  }))
}
