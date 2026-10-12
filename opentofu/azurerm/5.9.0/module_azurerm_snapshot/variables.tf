variable "snapshots" {
  description = <<EOT
Map of snapshots, attributes below
Required:
    - create_option
    - location
    - name
    - resource_group_name
Optional:
    - disk_access_id
    - disk_size_gb
    - incremental_enabled
    - network_access_policy
    - public_network_access_enabled
    - source_resource_id
    - source_uri
    - storage_account_id
    - tags
    - encryption_settings
EOT

  type = map(object({
    create_option                 = string
    location                      = string
    name                          = string
    resource_group_name           = string
    disk_access_id                = optional(string)
    disk_size_gb                  = optional(number)
    incremental_enabled           = optional(bool)
    network_access_policy         = optional(string)
    public_network_access_enabled = optional(bool)
    source_resource_id            = optional(string)
    source_uri                    = optional(string)
    storage_account_id            = optional(string)
    tags                          = optional(map(string))
    encryption_settings           = optional(list(object({
            disk_encryption_key = list(object({
                secret_url      = string
                source_vault_id = string
            }))
            key_encryption_key  = optional(list(object({
                key_url         = string
                source_vault_id = string
            })))
        })))
  }))
}
