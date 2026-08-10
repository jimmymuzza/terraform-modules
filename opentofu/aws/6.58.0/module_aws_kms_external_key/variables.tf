variable "kms_external_keys" {
  description = <<EOT
Map of kms_external_keys, attributes below
Optional:
    - bypass_policy_lockout_safety_check
    - deletion_window_in_days
    - description
    - enabled
    - key_material_base64
    - key_spec
    - key_usage
    - multi_region
    - policy
    - region
    - tags
    - tags_all
    - valid_to
EOT

  type = map(object({
    bypass_policy_lockout_safety_check = optional(bool)
    deletion_window_in_days            = optional(number)
    description                        = optional(string)
    enabled                            = optional(bool)
    key_material_base64                = optional(string)
    key_spec                           = optional(string)
    key_usage                          = optional(string)
    multi_region                       = optional(bool)
    policy                             = optional(string)
    region                             = optional(string)
    tags                               = optional(map(string))
    tags_all                           = optional(map(string))
    valid_to                           = optional(string)
  }))
}
