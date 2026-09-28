variable "ebs_snapshots" {
  description = <<EOT
Map of ebs_snapshots, attributes below
Required:
    - volume_id
Optional:
    - description
    - outpost_arn
    - permanent_restore
    - region
    - storage_tier
    - tags
    - tags_all
    - temporary_restore_days
EOT

  type = map(object({
    volume_id              = string
    description            = optional(string)
    outpost_arn            = optional(string)
    permanent_restore      = optional(bool)
    region                 = optional(string)
    storage_tier           = optional(string)
    tags                   = optional(map(string))
    tags_all               = optional(map(string))
    temporary_restore_days = optional(number)
  }))
}
