variable "storagegateway_tape_pools" {
  description = <<EOT
Map of storagegateway_tape_pools, attributes below
Required:
    - pool_name
    - storage_class
Optional:
    - region
    - retention_lock_time_in_days
    - retention_lock_type
    - tags
    - tags_all
EOT

  type = map(object({
    pool_name                   = string
    storage_class               = string
    region                      = optional(string)
    retention_lock_time_in_days = optional(number)
    retention_lock_type         = optional(string)
    tags                        = optional(map(string))
    tags_all                    = optional(map(string))
  }))
}
