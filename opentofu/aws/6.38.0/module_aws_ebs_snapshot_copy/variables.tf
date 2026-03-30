variable "ebs_snapshot_copies" {
  description = <<EOT
Map of ebs_snapshot_copies, attributes below
Required:
    - source_region
    - source_snapshot_id
Optional:
    - completion_duration_minutes
    - description
    - encrypted
    - kms_key_id
    - permanent_restore
    - region
    - storage_tier
    - tags
    - tags_all
    - temporary_restore_days
EOT

  type = map(object({
    source_region               = string
    source_snapshot_id          = string
    completion_duration_minutes = optional(number)
    description                 = optional(string)
    encrypted                   = optional(bool)
    kms_key_id                  = optional(string)
    permanent_restore           = optional(bool)
    region                      = optional(string)
    storage_tier                = optional(string)
    tags                        = optional(map(string))
    tags_all                    = optional(map(string))
    temporary_restore_days      = optional(number)
  }))
}
