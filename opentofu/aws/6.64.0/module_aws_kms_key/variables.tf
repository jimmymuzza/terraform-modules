variable "kms_keys" {
  description = <<EOT
Map of kms_keys, attributes below
Optional:
    - bypass_policy_lockout_safety_check
    - custom_key_store_id
    - customer_master_key_spec
    - deletion_window_in_days
    - description
    - enable_key_rotation
    - is_enabled
    - key_usage
    - multi_region
    - policy
    - region
    - rotation_period_in_days
    - tags
    - tags_all
    - xks_key_id
EOT

  type = map(object({
    bypass_policy_lockout_safety_check = optional(bool)
    custom_key_store_id                = optional(string)
    customer_master_key_spec           = optional(string)
    deletion_window_in_days            = optional(number)
    description                        = optional(string)
    enable_key_rotation                = optional(bool)
    is_enabled                         = optional(bool)
    key_usage                          = optional(string)
    multi_region                       = optional(bool)
    policy                             = optional(string)
    region                             = optional(string)
    rotation_period_in_days            = optional(number)
    tags                               = optional(map(string))
    tags_all                           = optional(map(string))
    xks_key_id                         = optional(string)
  }))
}
