variable "storage_management_policies" {
  description = <<EOT
Map of storage_management_policies, attributes below
Required:
    - storage_account_id
Optional:
    - rule
EOT

  type = map(object({
    storage_account_id = string
    rule               = optional(list(object({
            enabled = bool
            name    = string
            actions = list(object({
                base_blob = optional(list(object({
                    auto_tier_to_hot_from_cool_enabled                             = optional(bool)
                    delete_after_days_since_creation_greater_than                  = optional(number)
                    delete_after_days_since_last_access_time_greater_than          = optional(number)
                    delete_after_days_since_modification_greater_than              = optional(number)
                    tier_to_archive_after_days_since_creation_greater_than         = optional(number)
                    tier_to_archive_after_days_since_last_access_time_greater_than = optional(number)
                    tier_to_archive_after_days_since_last_tier_change_greater_than = optional(number)
                    tier_to_archive_after_days_since_modification_greater_than     = optional(number)
                    tier_to_cold_after_days_since_creation_greater_than            = optional(number)
                    tier_to_cold_after_days_since_last_access_time_greater_than    = optional(number)
                    tier_to_cold_after_days_since_modification_greater_than        = optional(number)
                    tier_to_cool_after_days_since_creation_greater_than            = optional(number)
                    tier_to_cool_after_days_since_last_access_time_greater_than    = optional(number)
                    tier_to_cool_after_days_since_modification_greater_than        = optional(number)
                })))
                snapshot  = optional(list(object({
                    change_tier_to_archive_after_days_since_creation               = optional(number)
                    change_tier_to_cool_after_days_since_creation                  = optional(number)
                    delete_after_days_since_creation_greater_than                  = optional(number)
                    tier_to_archive_after_days_since_last_tier_change_greater_than = optional(number)
                    tier_to_cold_after_days_since_creation_greater_than            = optional(number)
                })))
                version   = optional(list(object({
                    change_tier_to_archive_after_days_since_creation               = optional(number)
                    change_tier_to_cool_after_days_since_creation                  = optional(number)
                    delete_after_days_since_creation                               = optional(number)
                    tier_to_archive_after_days_since_last_tier_change_greater_than = optional(number)
                    tier_to_cold_after_days_since_creation_greater_than            = optional(number)
                })))
            }))
            filters = list(object({
                blob_types           = set(string)
                prefix_match         = optional(set(string))
                match_blob_index_tag = optional(set(object({
                    name      = string
                    value     = string
                    operation = optional(string)
                })))
            }))
        })))
  }))
}
