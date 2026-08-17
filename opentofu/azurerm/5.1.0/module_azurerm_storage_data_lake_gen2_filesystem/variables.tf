variable "storage_data_lake_gen2_filesystems" {
  description = <<EOT
Map of storage_data_lake_gen2_filesystems, attributes below
Required:
    - name
    - storage_account_id
Optional:
    - default_encryption_scope
    - group
    - owner
    - properties
    - ace
EOT

  type = map(object({
    name                     = string
    storage_account_id       = string
    default_encryption_scope = optional(string)
    group                    = optional(string)
    owner                    = optional(string)
    properties               = optional(map(string))
    ace                      = optional(set(object({
            permissions = string
            type        = string
            scope       = optional(string)
        })))
  }))
}
