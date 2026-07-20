variable "managed_lustre_file_systems" {
  description = <<EOT
Map of managed_lustre_file_systems, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sku_name
    - storage_capacity_in_tb
    - subnet_id
    - zones
    - maintenance_window
Optional:
    - tags
    - encryption_key
    - hsm_setting
    - identity
    - root_squash
EOT

  type = map(object({
    location               = string
    name                   = string
    resource_group_name    = string
    sku_name               = string
    storage_capacity_in_tb = number
    subnet_id              = string
    zones                  = set(string)
    tags                   = optional(map(string))
    encryption_key         = optional(list(object({
            key_url         = string
            source_vault_id = string
        })))
    hsm_setting            = optional(list(object({
            container_id         = string
            logging_container_id = string
            import_prefix        = optional(string)
        })))
    identity               = optional(list(object({
            identity_ids = set(string)
            type         = string
        })))
    maintenance_window     = list(object({
            day_of_week        = string
            time_of_day_in_utc = string
        }))
    root_squash            = optional(list(object({
            mode           = string
            no_squash_nids = string
            squash_gid     = optional(number)
            squash_uid     = optional(number)
        })))
  }))
}
