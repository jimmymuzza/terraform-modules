variable "redshift_snapshot_copy_grants" {
  description = <<EOT
Map of redshift_snapshot_copy_grants, attributes below
Required:
    - snapshot_copy_grant_name
Optional:
    - kms_key_id
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    snapshot_copy_grant_name = string
    kms_key_id               = optional(string)
    region                   = optional(string)
    tags                     = optional(map(string))
    tags_all                 = optional(map(string))
  }))
}
