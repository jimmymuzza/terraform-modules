variable "oracle_exascale_database_storage_vaults" {
  description = <<EOT
Map of oracle_exascale_database_storage_vaults, attributes below
Required:
    - additional_flash_cache_percentage
    - display_name
    - location
    - name
    - resource_group_name
    - zones
    - high_capacity_database_storage
Optional:
    - description
    - tags
    - time_zone
EOT

  type = map(object({
    additional_flash_cache_percentage = number
    display_name                      = string
    location                          = string
    name                              = string
    resource_group_name               = string
    zones                             = set(string)
    description                       = optional(string)
    tags                              = optional(map(string))
    time_zone                         = optional(string)
    high_capacity_database_storage    = list(object({
            total_size_in_gb = number
        }))
  }))
}
