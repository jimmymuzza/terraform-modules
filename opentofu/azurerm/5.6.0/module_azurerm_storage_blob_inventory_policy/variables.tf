variable "storage_blob_inventory_policies" {
  description = <<EOT
Map of storage_blob_inventory_policies, attributes below
Required:
    - storage_account_id
    - rules
EOT

  type = map(object({
    storage_account_id = string
    rules              = set(object({
            format                 = string
            name                   = string
            schedule               = string
            schema_fields          = list(string)
            scope                  = string
            storage_container_name = string
            filter                 = optional(list(object({
                blob_types            = set(string)
                exclude_prefixes      = optional(set(string))
                include_blob_versions = optional(bool)
                include_deleted       = optional(bool)
                include_snapshots     = optional(bool)
                prefix_match          = optional(set(string))
            })))
        }))
  }))
}
