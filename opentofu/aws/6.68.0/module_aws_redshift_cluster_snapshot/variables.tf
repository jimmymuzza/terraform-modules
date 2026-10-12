variable "redshift_cluster_snapshots" {
  description = <<EOT
Map of redshift_cluster_snapshots, attributes below
Required:
    - cluster_identifier
    - snapshot_identifier
Optional:
    - manual_snapshot_retention_period
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    cluster_identifier               = string
    snapshot_identifier              = string
    manual_snapshot_retention_period = optional(number)
    region                           = optional(string)
    tags                             = optional(map(string))
    tags_all                         = optional(map(string))
  }))
}
