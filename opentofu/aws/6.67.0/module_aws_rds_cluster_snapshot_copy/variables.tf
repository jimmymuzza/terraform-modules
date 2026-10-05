variable "rds_cluster_snapshot_copies" {
  description = <<EOT
Map of rds_cluster_snapshot_copies, attributes below
Required:
    - source_db_cluster_snapshot_identifier
    - target_db_cluster_snapshot_identifier
Optional:
    - copy_tags
    - destination_region
    - kms_key_id
    - presigned_url
    - region
    - shared_accounts
    - tags
EOT

  type = map(object({
    source_db_cluster_snapshot_identifier = string
    target_db_cluster_snapshot_identifier = string
    copy_tags                             = optional(bool)
    destination_region                    = optional(string)
    kms_key_id                            = optional(string)
    presigned_url                         = optional(string)
    region                                = optional(string)
    shared_accounts                       = optional(set(string))
    tags                                  = optional(map(string))
  }))
}
