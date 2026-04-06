variable "cloudtrail_event_data_stores" {
  description = <<EOT
Map of cloudtrail_event_data_stores, attributes below
Required:
    - name
Optional:
    - billing_mode
    - kms_key_id
    - multi_region_enabled
    - organization_enabled
    - region
    - retention_period
    - suspend
    - tags
    - tags_all
    - termination_protection_enabled
    - advanced_event_selector
EOT

  type = map(object({
    name                           = string
    billing_mode                   = optional(string)
    kms_key_id                     = optional(string)
    multi_region_enabled           = optional(bool)
    organization_enabled           = optional(bool)
    region                         = optional(string)
    retention_period               = optional(number)
    suspend                        = optional(string)
    tags                           = optional(map(string))
    tags_all                       = optional(map(string))
    termination_protection_enabled = optional(bool)
    advanced_event_selector        = optional(list(object({
            name           = optional(string)
            field_selector = optional(set(object({
                ends_with       = optional(list(string))
                equals          = optional(list(string))
                field           = optional(string)
                not_ends_with   = optional(list(string))
                not_equals      = optional(list(string))
                not_starts_with = optional(list(string))
                starts_with     = optional(list(string))
            })))
        })))
  }))
}
