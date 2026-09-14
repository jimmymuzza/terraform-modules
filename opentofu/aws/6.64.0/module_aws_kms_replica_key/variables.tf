variable "kms_replica_keys" {
  description = <<EOT
Map of kms_replica_keys, attributes below
Required:
    - primary_key_arn
Optional:
    - bypass_policy_lockout_safety_check
    - deletion_window_in_days
    - description
    - enabled
    - policy
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    primary_key_arn                    = string
    bypass_policy_lockout_safety_check = optional(bool)
    deletion_window_in_days            = optional(number)
    description                        = optional(string)
    enabled                            = optional(bool)
    policy                             = optional(string)
    region                             = optional(string)
    tags                               = optional(map(string))
    tags_all                           = optional(map(string))
  }))
}
