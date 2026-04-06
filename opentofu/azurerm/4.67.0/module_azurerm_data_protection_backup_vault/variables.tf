variable "data_protection_backup_vaults" {
  description = <<EOT
Map of data_protection_backup_vaults, attributes below
Required:
    - datastore_type
    - location
    - name
    - redundancy
    - resource_group_name
Optional:
    - cross_region_restore_enabled
    - immutability
    - retention_duration_in_days
    - soft_delete
    - tags
    - identity
EOT

  type = map(object({
    datastore_type               = string
    location                     = string
    name                         = string
    redundancy                   = string
    resource_group_name          = string
    cross_region_restore_enabled = optional(bool)
    immutability                 = optional(string)
    retention_duration_in_days   = optional(number)
    soft_delete                  = optional(string)
    tags                         = optional(map(string))
    identity                     = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
  }))
}
