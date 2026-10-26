variable "data_protection_backup_instance_data_lake_storages" {
  description = <<EOT
Map of data_protection_backup_instance_data_lake_storages, attributes below
Required:
    - backup_policy_data_lake_storage_id
    - data_protection_backup_vault_id
    - location
    - name
    - storage_account_id
    - storage_container_names
EOT

  type = map(object({
    backup_policy_data_lake_storage_id = string
    data_protection_backup_vault_id    = string
    location                           = string
    name                               = string
    storage_account_id                 = string
    storage_container_names            = set(string)
  }))
}
