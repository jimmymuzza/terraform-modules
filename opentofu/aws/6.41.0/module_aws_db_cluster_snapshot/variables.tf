variable "db_cluster_snapshots" {
  description = <<EOT
Map of db_cluster_snapshots, attributes below
Required:
    - db_cluster_identifier
    - db_cluster_snapshot_identifier
Optional:
    - region
    - shared_accounts
    - tags
    - tags_all
EOT

  type = map(object({
    db_cluster_identifier          = string
    db_cluster_snapshot_identifier = string
    region                         = optional(string)
    shared_accounts                = optional(set(string))
    tags                           = optional(map(string))
    tags_all                       = optional(map(string))
  }))
}
