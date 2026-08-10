variable "db_snapshot_copies" {
  description = <<EOT
Map of db_snapshot_copies, attributes below
Required:
    - source_db_snapshot_identifier
    - target_db_snapshot_identifier
Optional:
    - copy_tags
    - destination_region
    - kms_key_id
    - option_group_name
    - presigned_url
    - region
    - shared_accounts
    - tags
    - tags_all
    - target_custom_availability_zone
EOT

  type = map(object({
    source_db_snapshot_identifier   = string
    target_db_snapshot_identifier   = string
    copy_tags                       = optional(bool)
    destination_region              = optional(string)
    kms_key_id                      = optional(string)
    option_group_name               = optional(string)
    presigned_url                   = optional(string)
    region                          = optional(string)
    shared_accounts                 = optional(set(string))
    tags                            = optional(map(string))
    tags_all                        = optional(map(string))
    target_custom_availability_zone = optional(string)
  }))
}
