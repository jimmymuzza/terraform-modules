variable "redshift_snapshot_schedule_associations" {
  description = <<EOT
Map of redshift_snapshot_schedule_associations, attributes below
Required:
    - cluster_identifier
    - schedule_identifier
Optional:
    - region
EOT

  type = map(object({
    cluster_identifier  = string
    schedule_identifier = string
    region              = optional(string)
  }))
}
